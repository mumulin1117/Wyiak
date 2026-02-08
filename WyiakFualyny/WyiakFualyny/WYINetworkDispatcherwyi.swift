//
//  WYINetworkDispatcherwyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/8.
//

import UIKit

struct WYINetworkDispatcherwyi {
    
    private static let wyiBaseHostComponent = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "5qUaiyTziAZuhZIb7+2a7a2aSn86yFhbWoP01Fw5nVPE56L33wQVodRDYMtcXx/59ZtSndO4ZWrPTY0UL+Q5GYIy")
    private static let wyiBackendPathComponent = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "VS2v0jNfyUWpHfxqmuQV0H5bBpkCm7Ds8nY/bODSXG372dJROEvXjfA=")
    private static let wyiConfigurationPreset = URLSessionConfiguration.default
    private static let wyiTimeoutThreshold: TimeInterval = 30.0
    private static let wyiApplicationKeyIdentifier = "60420695"
    private static let wyiContentTypeJSON = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "Y9fBXENqNfK/sqA8yOYcbJKmp7qHpUuYtwTVaPz8pzujoWEArNZgCBI61W+thOyd")
    private static let wyiAcceptTypeJSON = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "Y9fBXENqNfK/sqA8yOYcbJKmp7qHpUuYtwTVaPz8pzujoWEArNZgCBI61W+thOyd")
    
    static func wyiExecuteNetworkOperation(
        operationEndpointwyi: String,
        operationPayloadwyi: [String: Any],
        completionSuccesswyi: ((Any?) -> Void)? = nil,
        completionFailurewyi: ((Error) -> Void)? = nil
    ) {
        let fullEndpointPath = wyiResolveEndpointPath(basePath: operationEndpointwyi)
        
        guard let targetURLwyi = wyiCreateTargetURL(pathComponent: fullEndpointPath) else {
            wyiHandleURLCreationFailure(completionFailurewyi)
            return
        }
        
        let baseRequestwyi = wyiConstructBaseRequest(
            targetURL: targetURLwyi,
            payloadData: operationPayloadwyi
        )
        
        let finalRequestwyi = wyiApplyRequestHeaders(
            baseRequest: baseRequestwyi,
            operationToken: WYIRouterCorewyi.wyiSessionToken
        )
        
        let sessionConfigwyi = wyiCreateSessionConfiguration()
        
        wyiPerformDataTask(
            sessionConfig: sessionConfigwyi,
            request: finalRequestwyi,
            successHandler: completionSuccesswyi,
            failureHandler: completionFailurewyi
        )
    }
    
    private static func wyiResolveEndpointPath(basePath: String) -> String {
        let pathSegmentOne = wyiBackendPathComponent
        let pathSegmentTwo = basePath
        return pathSegmentOne + pathSegmentTwo
    }
    
    private static func wyiCreateTargetURL(pathComponent: String) -> URL? {
        let hostComponent = wyiBaseHostComponent
        let fullPath = hostComponent + pathComponent
        return URL(string: fullPath)
    }
    
    private static func wyiHandleURLCreationFailure(_ failureHandler: ((Error) -> Void)?) {
        let errorValue = NSError(
            domain: "WYINetworkErrorDomain",
            code: 1001,
            userInfo: [NSLocalizedDescriptionKey: "Invalid URL construction"]
        )
        
        DispatchQueue.main.async {
            failureHandler?(errorValue)
        }
    }
    
    private static func wyiConstructBaseRequest(
        targetURL: URL,
        payloadData: [String: Any]
    ) -> URLRequest {
        var requestInstance = URLRequest(
            url: targetURL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: wyiTimeoutThreshold
        )
        
        requestInstance.httpMethod = WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "6jfA1xTxnBTtQHdXT8qa9b9AV92A58VwvjWDLV31KsIjqFtv")
        requestInstance.setValue(wyiContentTypeJSON, forHTTPHeaderField:WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "6YSIPLWG9LCLRxkjn65CZ7Jc8jQKKLTcX4uCxt/R5ZYO/imY1CzOoskpusU=") )
        requestInstance.setValue(wyiAcceptTypeJSON, forHTTPHeaderField: WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "JE6RtKmu6nDzt2Vk988H+C8LSHyxe3Wy/RbcFUvywbiLBMLrUlo="))
        
        let bodyData = wyiSerializePayloadToJSON(payload: payloadData)
        requestInstance.httpBody = bodyData
        
        return requestInstance
    }
    
    private static func wyiSerializePayloadToJSON(payload: [String: Any]) -> Data? {
        let serializationOptions = JSONSerialization.WritingOptions()
        
        do {
            let jsonData = try JSONSerialization.data(
                withJSONObject: payload,
                options: serializationOptions
            )
            return jsonData
        } catch {
            return nil
        }
    }
    
    private static func wyiApplyRequestHeaders(
        baseRequest: URLRequest,
        operationToken: String?
    ) -> URLRequest {
        var mutableRequest = baseRequest
        
        let headerDictionary = wyiGenerateHeaderDictionary(tokenValue: operationToken)
        
        for (headerKey, headerValue) in headerDictionary {
            mutableRequest.setValue(headerValue, forHTTPHeaderField: headerKey)
        }
        
        return mutableRequest
    }
    
    private static func wyiGenerateHeaderDictionary(tokenValue: String?) -> [String: String] {
        var headers = [String: String]()
        
        headers[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "p5+BphQZ2Nj5an42FiVs3YLRB/KalLvLjHghcxbN286orsY=")] = wyiApplicationKeyIdentifier
        headers[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "Kl9J+fKOVTw21690u1MqpcXg88Rv0ZKpeCYcLCmwBx7o0A0lOw==")] = tokenValue ?? ""
        
      
        return headers
    }
    
    private static func wyiCreateSessionConfiguration() -> URLSessionConfiguration {
        let configuration = wyiConfigurationPreset
        configuration.timeoutIntervalForRequest = wyiTimeoutThreshold
        configuration.timeoutIntervalForResource = wyiTimeoutThreshold * 2
        
        configuration.httpAdditionalHeaders = [WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "4hMbfSo4LVw38YoU7tYLlTh1cMUzZoUWKJTPHNU9i9p9/ONi9Te3Y5D8"): wyiGenerateUserAgentString()]
        configuration.requestCachePolicy = .useProtocolCachePolicy
        
        return configuration
    }
    
    private static func wyiGenerateUserAgentString() -> String {
        let deviceInfo = UIDevice.current
        let systemVersion = deviceInfo.systemVersion
        let deviceModel = deviceInfo.model
        let appVersion = Bundle.main.infoDictionary?[WYICryptoProcessorwyi.wyiDecryptEncodedString(encodedString: "vxRS3JMw6eXtJ0aCGYmKUyMQoKWN8iglDMXifJEtnDlidZZlb1rADQe/EXroWju/UxH7aJFZPUOvbg==")] as? String ?? "1.0"
        
        return "WyiakApp/\(appVersion) (\(deviceModel); iOS \(systemVersion))"
    }
    
    private static func wyiPerformDataTask(
        sessionConfig: URLSessionConfiguration,
        request: URLRequest,
        successHandler: ((Any?) -> Void)?,
        failureHandler: ((Error) -> Void)?
    ) {
        let sessionInstance = URLSession(configuration: sessionConfig)
        
        let taskIdentifier = UUID().uuidString
        wyiLogTaskInitiation(taskId: taskIdentifier, requestURL: request.url?.absoluteString ?? "")
        
        sessionInstance.dataTask(with: request) { responseData, _, responseError in
            wyiLogTaskCompletion(taskId: taskIdentifier, hasError: responseError != nil)
            
            DispatchQueue.main.async {
                if let errorInstance = responseError {
                    wyiHandleTaskError(
                        error: errorInstance,
                        taskId: taskIdentifier,
                        failureHandler: failureHandler
                    )
                    return
                }
                
                guard let dataInstance = responseData else {
                    wyiHandleMissingData(failureHandler: failureHandler)
                    return
                }
                
                wyiProcessResponseData(
                    data: dataInstance,
                    successHandler: successHandler,
                    failureHandler: failureHandler
                )
            }
        }.resume()
    }
    
    private static func wyiLogTaskInitiation(taskId: String, requestURL: String) {
        let timestamp = Date().timeIntervalSince1970
        print("WYI_TASK_START [\(taskId)] URL: \(requestURL) TIME: \(timestamp)")
    }
    
    private static func wyiLogTaskCompletion(taskId: String, hasError: Bool) {
        let status = hasError ? "FAILED" : "COMPLETED"
        print("WYI_TASK_\(status) [\(taskId)]")
    }
    
    private static func wyiHandleTaskError(
        error: Error,
        taskId: String,
        failureHandler: ((Error) -> Void)?
    ) {
        let enhancedError = wyiEnhanceErrorWithContext(originalError: error, taskId: taskId)
        failureHandler?(enhancedError)
    }
    
    private static func wyiEnhanceErrorWithContext(originalError: Error, taskId: String) -> Error {
        let errorCode = (originalError as NSError).code
        let errorDescription = originalError.localizedDescription
        
        let enhancedInfo = [
            NSLocalizedDescriptionKey: "Network operation failed: \(errorDescription)",
            "WYI_TaskID": taskId,
            "WYI_ErrorCode": String(errorCode),
            "WYI_Timestamp": String(Int(Date().timeIntervalSince1970))
        ]
        
        return NSError(
            domain: "WYINetworkEnhancedErrorDomain",
            code: errorCode,
            userInfo: enhancedInfo
        )
    }
    
    private static func wyiHandleMissingData(failureHandler: ((Error) -> Void)?) {
        let errorValue = NSError(
            domain: "WYINetworkErrorDomain",
            code: 1002,
            userInfo: [NSLocalizedDescriptionKey: "No data received from server"]
        )
        failureHandler?(errorValue)
    }
    
    private static func wyiProcessResponseData(
        data: Data,
        successHandler: ((Any?) -> Void)?,
        failureHandler: ((Error) -> Void)?
    ) {
        do {
            let parsingOptions = JSONSerialization.ReadingOptions.allowFragments
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: parsingOptions)
            
            wyiValidateResponseStructure(jsonObject: jsonObject)
            successHandler?(jsonObject)
            
        } catch let parsingError {
            wyiHandleParsingFailure(
                error: parsingError,
                rawData: data,
                failureHandler: failureHandler
            )
        }
    }
    
    private static func wyiValidateResponseStructure(jsonObject: Any) {
        if let dict = jsonObject as? [String: Any] {
            let hasStatusKey = dict.keys.contains("status")
            let hasCodeKey = dict.keys.contains("code")
            
            let validationResult = hasStatusKey || hasCodeKey
            
            if !validationResult {
                
            }
        }
    }
    
    private static func wyiHandleParsingFailure(
        error: Error,
        rawData: Data,
        failureHandler: ((Error) -> Void)?
    ) {
        let dataString = String(data: rawData, encoding: .utf8) ?? "Unable to convert data to string"
        
        let enhancedError = wyiEnhanceParsingError(
            originalError: error,
            responseData: rawData
        )
        failureHandler?(enhancedError)
    }
    
    private static func wyiEnhanceParsingError(
        originalError: Error,
        responseData: Data
    ) -> Error {
        let dataPreview = String(data: responseData.prefix(200), encoding: .utf8) ?? "Invalid data"
        
        let enhancedInfo = [
            NSLocalizedDescriptionKey: "Failed to parse server response: \(originalError.localizedDescription)",
            "WYI_DataPreview": dataPreview,
            "WYI_DataLength": String(responseData.count),
            "WYI_ErrorType": "JSONParsingError"
        ]
        
        return NSError(
            domain: "WYIJSONParsingErrorDomain",
            code: 1003,
            userInfo: enhancedInfo
        )
    }
}
