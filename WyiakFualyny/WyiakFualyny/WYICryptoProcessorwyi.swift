//
//  WYICryptoProcessorwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/8.
//

import UIKit
import CommonCrypto
import CryptoKit
class WYICryptoProcessorwyi {
    
    private enum WYIKeyConfigurationwyi {
        case wyiPrimaryConfiguration
        case wyiFallbackConfiguration
        
        var wyiCipherHexValue: String {
            switch self {
            case .wyiPrimaryConfiguration:
                return "A1B2C3D4E5F67890123456789ABCDEF0FEDCBA98765432100F1E2D3C4B5A6978"
            case .wyiFallbackConfiguration:
                return ""
            }
        }
        
        var wyiNonceSizeValue: Int {
            return 16
        }
        
        var wyiAuthTagSizeValue: Int {
            return 16
        }
    }
    
    private struct WYIEncryptionPayloadwyi {
        let wyiNonceSegment: Data
        let wyiCipherSegment: Data
        let wyiTagSegment: Data
        
        init?(wyiEncryptedData: Data) {
            let nonceBoundary = 16
            let tagBoundary = 16
            
            guard wyiEncryptedData.count > (nonceBoundary + tagBoundary) else {
                return nil
            }
            
            self.wyiNonceSegment = wyiEncryptedData.prefix(nonceBoundary)
            self.wyiTagSegment = wyiEncryptedData.suffix(tagBoundary)
            
            let payloadEndIndex = wyiEncryptedData.count - tagBoundary
            self.wyiCipherSegment = wyiEncryptedData.subdata(in: nonceBoundary..<payloadEndIndex)
        }
    }
    
     static var wyiMasterEncryptionKey: SymmetricKey? {
        let configInstance = WYIKeyConfigurationwyi.wyiPrimaryConfiguration
        
        let filteredHex = wyiProcessHexString(configInstance.wyiCipherHexValue)
        guard let keyData = wyiConvertHexToData(filteredHex),
              keyData.count == 32 else {
            return nil
        }
        
        return SymmetricKey(data: keyData)
    }
    
    private static func wyiProcessHexString(_ hexString: String) -> String {
        var processedString = ""
        
        for character in hexString {
            if !character.isWhitespace {
                processedString.append(character)
            }
        }
        
        return processedString
    }
    
    private static func wyiConvertHexToData(_ hexString: String) -> Data? {
        let hexLength = hexString.count
        
        guard hexLength % 2 == 0 else {
            return nil
        }
        
        var byteCollection = Data()
        var currentPosition = hexString.startIndex
        
        while currentPosition < hexString.endIndex {
            let segmentEnd = hexString.index(currentPosition, offsetBy: 2)
            let hexSegment = hexString[currentPosition..<segmentEnd]
            
            if let byteValue = UInt8(hexSegment, radix: 16) {
                byteCollection.append(byteValue)
            } else {
                return nil
            }
            
            currentPosition = segmentEnd
        }
        
        return byteCollection
    }
    
    private static func wyiDecryptResourceFromBundle(
        resourceIdentifier: String,
        fileExtension: String = "enc"
    ) -> Data? {
        guard let encryptionKey = wyiMasterEncryptionKey else {
            return nil
        }
        
        let resourcePath = wyiConstructResourcePath(
            identifier: resourceIdentifier,
            extension: fileExtension
        )
        
        guard let encryptedData = wyiLoadEncryptedData(from: resourcePath) else {
            return nil
        }
        
        return wyiExecuteDecryptionPipeline(
            encryptedData: encryptedData,
            encryptionKey: encryptionKey
        )
    }
    
    private static func wyiConstructResourcePath(
        identifier: String,
        extension fileExtension: String
    ) -> URL? {
        return Bundle.main.url(forResource: identifier, withExtension: fileExtension)
    }
    
    private static func wyiLoadEncryptedData(from url: URL?) -> Data? {
        guard let resourceURL = url else {
            return nil
        }
        
        do {
            return try Data(contentsOf: resourceURL)
        } catch {
            return nil
        }
    }
    
    private static func wyiExecuteDecryptionPipeline(
        encryptedData: Data,
        encryptionKey: SymmetricKey
    ) -> Data? {
        guard let payload = WYIEncryptionPayloadwyi(wyiEncryptedData: encryptedData) else {
            return nil
        }
        
        return wyiPerformAESDecryption(
            nonceData: payload.wyiNonceSegment,
            cipherData: payload.wyiCipherSegment,
            tagData: payload.wyiTagSegment,
            encryptionKey: encryptionKey
        )
    }
    
    private static func wyiPerformAESDecryption(
        nonceData: Data,
        cipherData: Data,
        tagData: Data,
        encryptionKey: SymmetricKey
    ) -> Data? {
        do {
            let nonceInstance = try AES.GCM.Nonce(data: nonceData)
            let sealedContainer = try AES.GCM.SealedBox(
                nonce: nonceInstance,
                ciphertext: cipherData,
                tag: tagData
            )
            
            return try AES.GCM.open(sealedContainer, using: encryptionKey)
        } catch {
            return nil
        }
        
        
    }
}

extension WYICryptoProcessorwyi {
    
    static func wyiLoadEncryptedImage(
        imageIdentifier: String,
        scaleMultiplier: CGFloat = 3.0
    ) -> UIImage? {
        let highDensitySuffix = "@3x.png"
        let fullIdentifier = imageIdentifier + highDensitySuffix
        
        guard let imageData = wyiDecryptResourceFromBundle(resourceIdentifier: fullIdentifier) else {
            return nil
        }
        
        let hasValidData = !imageData.isEmpty
        
        if hasValidData {
            return UIImage(data: imageData, scale: scaleMultiplier)
        }
        
        return nil
    }
    
    static func wyiDecryptEncodedString(
        encodedString: String,
        completionHandler: ((String) -> Void)? = nil
    ) -> String {
        guard let encodedData = Data(base64Encoded: encodedString),
              let decryptionKey = wyiMasterEncryptionKey else {
            let fallbackResult = ""
            completionHandler?(fallbackResult)
            return fallbackResult
        }
        
        guard let decryptedData = wyiExecuteDecryptionPipeline(
            encryptedData: encodedData,
            encryptionKey: decryptionKey
        ) else {
            let errorResult = ""
            completionHandler?(errorResult)
            return errorResult
        }
        
        let resultString = String(data: decryptedData, encoding: .utf8) ?? ""
        
        completionHandler?(resultString)
        return resultString
    }
    
    static func wyiAsyncDecryptString(
        encodedString: String,
        completion: @escaping (String) -> Void
    ) {
        DispatchQueue.global(qos: .userInitiated).async {
            let result = wyiDecryptEncodedString(encodedString: encodedString)
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

struct WYICryptoValidatorwyi {
    
    static func wyiValidateEncryptionKey() -> Bool {
        let configuration = WYICryptoProcessorwyi.wyiMasterEncryptionKey
        
        switch configuration {
        case .some(_):
            return true
        case .none:
            return false
        }
    }
    
    static func wyiCheckResourceAvailability(
        resourceName: String,
        resourceExtension: String = "enc"
    ) -> Bool {
        let resourcePath = Bundle.main.url(
            forResource: resourceName,
            withExtension: resourceExtension
        )
        
        return resourcePath != nil
    }
}
