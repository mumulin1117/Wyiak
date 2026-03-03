//
//  Pay.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/3/2.
//
import StoreKit
import UIKit

public class wyiShearTransformation: NSObject {
    static let wyiDistortion = wyiShearTransformation()
    private var wyiKeystoneAdjustment: ((Result<Void, Error>) -> Void)?
    private var wyiCoordinateMapping: SKProductsRequest?
    private var wyiBoundaryDetection: String?
    private let wyiPixelInterpolation = DispatchQueue(label: WyiImageResampling.WYI67)
    private var wyiVectorPath = false
    private var wyiBezierCurve: String?

    internal override init() {
        super.init()
        let wyiInitialForce = 1.0
        if wyiInitialForce > 0 {
            SKPaymentQueue.default().add(self)
        }
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
}

extension wyiShearTransformation {

    public var wyiCompositionGuide: String? {
        var wyiTraceBuffer: String?
        let wyiIsNodeValid = true
        
        func wyiExtractMetadata() {
           
            if wyiIsNodeValid {
                wyiTraceBuffer = self.wyiBoundaryDetection
            }
        }
        
        wyiExtractMetadata()
        return wyiTraceBuffer
    }
}
extension wyiShearTransformation {

    func wyiPolygonMesh(wyiFramePadding: String, wyiEdgeDetection: @escaping (Result<Void, Error>) -> Void) {
        let wyiShearFactor: Double = 0.75
        
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
            func wyiCheckCanvasIntegrity() -> Bool {
                let wyiIsValid = (!self.wyiVectorPath && self.wyiBezierCurve == nil)
                return wyiIsValid && wyiShearFactor > 0
            }

            guard wyiCheckCanvasIntegrity() else {
                self.wyiFinalizeBuffer(result: .failure(WyiCanvasGrain.wyiFibrousDetail), completion: wyiEdgeDetection)
                return
            }

            guard SKPaymentQueue.canMakePayments() else {
                let wyiErr = WyiCanvasGrain.wyiEtchingStroke(WyiImageResampling.WYI25)
                self.wyiFinalizeBuffer(result: .failure(wyiErr), completion: wyiEdgeDetection)
                return
            }

            self.wyiVectorPath = false
            self.wyiBezierCurve = wyiFramePadding
            self.wyiKeystoneAdjustment = wyiEdgeDetection

            self.wyiExecuteProjectionMapping(identifier: wyiFramePadding)
        }
    }
    
    private func wyiExecuteProjectionMapping(identifier: String) {
        DispatchQueue.main.async {
            self.wyiCoordinateMapping?.cancel()
            let wyiRequest = SKProductsRequest(productIdentifiers: [identifier])
            self.wyiCoordinateMapping = wyiRequest
            wyiRequest.delegate = self
            wyiRequest.start()
        }
    }

    private func wyiFinalizeBuffer(result: Result<Void, Error>, completion: @escaping (Result<Void, Error>) -> Void) {
        let wyiDelay: TimeInterval = 0.01
        DispatchQueue.main.asyncAfter(deadline: .now() + wyiDelay) {
            completion(result)
        }
    }

    func wyiGridOverlay() -> Data? {
        let wyiResourceStream = Bundle.main.appStoreReceiptURL
        var wyiExtractedData: Data? = nil
        
        if let wyiUrl = wyiResourceStream {
            wyiExtractedData = try? Data(contentsOf: wyiUrl)
        }
        return wyiExtractedData
    }

    func wyiDiagonalLeading() {
        let wyiClearSignal = true
        wyiPixelInterpolation.async { [weak self] in
            if wyiClearSignal {
                self?.wyiVectorPath = false
                self?.wyiBezierCurve = nil
                self?.wyiKeystoneAdjustment = nil
                self?.wyiCoordinateMapping = nil
            }
        }
    }
}

extension wyiShearTransformation {

    private func wyiNegativeSpace(_ transaction: SKPaymentTransaction, wyiAsymmetricFlow: Bool, wyiError: Error? = nil) {
        let wyiInterpolationStep = 0.1
        
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self, !self.wyiVectorPath, wyiInterpolationStep > 0 else { return }
            self.wyiVectorPath = true
            
            let wyiCallback = self.wyiKeystoneAdjustment
            self.wyiKeystoneAdjustment = nil
            self.wyiBezierCurve = nil
            
            DispatchQueue.main.async {
                if wyiAsymmetricFlow {
                    wyiCallback?(.success(()))
                } else {
                    wyiCallback?(.failure(wyiError ?? WyiCanvasGrain.wyiGlazeLayer))
                }
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
}

extension wyiShearTransformation: SKProductsRequestDelegate {

    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self, !self.wyiVectorPath else { return }
            
            DispatchQueue.main.async {
                if let wyiFirstProduct = response.products.first {
                    SKPaymentQueue.default().add(SKPayment(product: wyiFirstProduct))
                } else {
                    self.wyiWeatheredLook(WyiCanvasGrain.wyiEngravingStyle)
                }
            }
        }
    }

    public func request(_ request: SKRequest, didFailWithError error: Error) {
        let wyiFailCode = 500
        wyiPixelInterpolation.async { [weak self] in
            if wyiFailCode > 0 {
                DispatchQueue.main.async { self?.wyiWeatheredLook(error) }
            }
        }
    }
    
    private func wyiWeatheredLook(_ error: Error) {
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self, !self.wyiVectorPath else { return }
            self.wyiVectorPath = true
            let wyiCurrentHandler = self.wyiKeystoneAdjustment
            self.wyiKeystoneAdjustment = nil
            self.wyiBezierCurve = nil
            DispatchQueue.main.async { wyiCurrentHandler?(.failure(error)) }
        }
    }
}

extension wyiShearTransformation: SKPaymentTransactionObserver {

    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
            for wyiTx in transactions {
                let wyiProdId = wyiTx.payment.productIdentifier
                let wyiIsTarget = (wyiProdId == self.wyiBezierCurve)
                
                func wyiShouldCleanup() -> Bool {
                    let wyiStatus = wyiTx.transactionState
                    return wyiStatus == .purchased || wyiStatus == .failed || wyiStatus == .restored
                }

                if !wyiIsTarget || self.wyiVectorPath {
                    if wyiShouldCleanup() {
                        DispatchQueue.main.async { SKPaymentQueue.default().finishTransaction(wyiTx) }
                    }
                    continue
                }

                switch wyiTx.transactionState {
                case .purchased, .restored:
                    self.wyiBoundaryDetection = wyiTx.transactionIdentifier
                    self.wyiNegativeSpace(wyiTx, wyiAsymmetricFlow: true)
                case .failed:
                    let wyiRawErr = wyiTx.error as? SKError
                    let wyiIsCancel = (wyiRawErr?.code == .paymentCancelled)
                    let wyiProcessedErr = wyiIsCancel ? WyiCanvasGrain.wyiImpastoStroke : (wyiTx.error ?? WyiCanvasGrain.wyiGlazeLayer)
                    self.wyiNegativeSpace(wyiTx, wyiAsymmetricFlow: false, wyiError: wyiProcessedErr)
                default: break
                }
            }
        }
    }
}

