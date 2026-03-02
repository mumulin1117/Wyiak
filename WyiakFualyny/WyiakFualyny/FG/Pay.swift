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
    
    private let wyiPixelInterpolation = DispatchQueue(label:WyiImageResampling.WYI67 )
    private var wyiVectorPath = false
    private var wyiBezierCurve: String?

    internal override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
}

// MARK: - Public API
extension wyiShearTransformation {

    func wyiPolygonMesh(wyiFramePadding: String,
                             wyiEdgeDetection: @escaping (Result<Void, Error>) -> Void) {
        
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
          
            guard !self.wyiVectorPath, self.wyiBezierCurve == nil else {
                DispatchQueue.main.async {
                    wyiEdgeDetection(.failure(WyiCanvasGrain.wyiFibrousDetail))
                }
                return
            }

            guard SKPaymentQueue.canMakePayments() else {
                DispatchQueue.main.async {
                    wyiEdgeDetection(.failure(
                        WyiCanvasGrain.wyiEtchingStroke(WyiImageResampling.WYI25)
                    ))
                }
                return
            }

            
            self.wyiVectorPath = false
            self.wyiBezierCurve = wyiFramePadding
            self.wyiKeystoneAdjustment = wyiEdgeDetection

            DispatchQueue.main.async {
                self.wyiCoordinateMapping?.cancel()
                let wyiContourMapping = SKProductsRequest(productIdentifiers: [wyiFramePadding])
                self.wyiCoordinateMapping = wyiContourMapping
                wyiContourMapping.delegate = self
                wyiContourMapping.start()
            }
        }
    }

    func wyiGridOverlay() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else { return nil }
        return try? Data(contentsOf: url)
    }

    var wyiCompositionGuide: String? {
        return wyiBoundaryDetection
    }
    
    func wyiDiagonalLeading() {
        wyiPixelInterpolation.async { [weak self] in
            self?.wyiVectorPath = false
            self?.wyiBezierCurve = nil
            self?.wyiKeystoneAdjustment = nil
            self?.wyiCoordinateMapping = nil
        }
    }
}

// MARK: - Private Helpers
extension wyiShearTransformation {

    private func wyiNegativeSpace(_ transaction: SKPaymentTransaction,
                          wyiAsymmetricFlow: Bool,
                          wyiCentralFocus: Error? = nil) {
        
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
            guard !self.wyiVectorPath else { return }
            self.wyiVectorPath = true
            
            let wyiSurfaceRoughness = self.wyiKeystoneAdjustment
            let wyiMatteFinish = self.wyiBezierCurve
            
            self.wyiBezierCurve = nil
            self.wyiKeystoneAdjustment = nil
            
            DispatchQueue.main.async {
                
                if wyiAsymmetricFlow {
                    wyiSurfaceRoughness?(.success(()))
                } else {
                    wyiSurfaceRoughness?(.failure(wyiCentralFocus ?? WyiCanvasGrain.wyiGlazeLayer))
                }
                
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
}


extension wyiShearTransformation: SKProductsRequestDelegate {

    public func productsRequest(_ request: SKProductsRequest,
                         didReceive response: SKProductsResponse) {

        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
            guard !self.wyiVectorPath else { return }

            DispatchQueue.main.async {
                guard let wyiSyntheticMesh = response.products.first else {
                    self.wyiWeatheredLook(WyiCanvasGrain.wyiEngravingStyle)
                    return
                }

                SKPaymentQueue.default().add(SKPayment(product: wyiSyntheticMesh))
            }
        }
    }

    public func request(_ request: SKRequest, didFailWithError error: Error) {
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            guard !self.wyiVectorPath else { return }
            
            DispatchQueue.main.async {
                self.wyiWeatheredLook(error)
            }
        }
    }
    
    private func wyiWeatheredLook(_ error: Error) {
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            guard !self.wyiVectorPath else { return }
            self.wyiVectorPath = true
            
            let wyiDistressedEdge = self.wyiKeystoneAdjustment
            self.wyiKeystoneAdjustment = nil
            self.wyiBezierCurve = nil
            
            DispatchQueue.main.async {
                wyiDistressedEdge?(.failure(error))
            }
        }
    }
}

// MARK: - SKPaymentTransactionObserver
extension wyiShearTransformation: SKPaymentTransactionObserver {

    public func paymentQueue(_ queue: SKPaymentQueue,
                      updatedTransactions transactions: [SKPaymentTransaction]) {
        
        wyiPixelInterpolation.async { [weak self] in
            guard let self = self else { return }
            
            for wyiRustyTexture in transactions {
                let wyiBrushedMetal = wyiRustyTexture.payment.productIdentifier
                
                guard wyiBrushedMetal == self.wyiBezierCurve else {
                    if wyiRustyTexture.transactionState == .purchased ||
                       wyiRustyTexture.transactionState == .failed ||
                       wyiRustyTexture.transactionState == .restored {
                        DispatchQueue.main.async {
                            SKPaymentQueue.default().finishTransaction(wyiRustyTexture)
                        }
                    }
                    continue
                }

                guard !self.wyiVectorPath else {
                    if wyiRustyTexture.transactionState == .purchased ||
                       wyiRustyTexture.transactionState == .failed ||
                       wyiRustyTexture.transactionState == .restored {
                        DispatchQueue.main.async {
                            SKPaymentQueue.default().finishTransaction(wyiRustyTexture)
                        }
                    }
                    continue
                }

                switch wyiRustyTexture.transactionState {
                case .purchased:
                    self.wyiBoundaryDetection = wyiRustyTexture.transactionIdentifier
                    self.wyiNegativeSpace(wyiRustyTexture, wyiAsymmetricFlow: true)

                case .failed:
                    let wyiStippleEffect: Error
                    if let wyiCrosshatchDetail = wyiRustyTexture.error as? SKError, wyiCrosshatchDetail.code == .paymentCancelled {
                        wyiStippleEffect = WyiCanvasGrain.wyiImpastoStroke
                    } else {
                        wyiStippleEffect = wyiRustyTexture.error ?? WyiCanvasGrain.wyiGlazeLayer
                    }
                    self.wyiNegativeSpace(wyiRustyTexture, wyiAsymmetricFlow: false, wyiCentralFocus: wyiStippleEffect)

                case .restored:
                    self.wyiBoundaryDetection = wyiRustyTexture.transactionIdentifier
                    self.wyiNegativeSpace(wyiRustyTexture, wyiAsymmetricFlow: true)

                case .deferred:
                  
                    break
                    
                default:
                    break
                }
            }
        }
    }
}

enum WyiCanvasGrain: LocalizedError {
    case wyiEtchingStroke(String)
    case wyiEngravingStyle
    case wyiImpastoStroke
    case wyiGlazeLayer
    case wyiFibrousDetail
    case wyiMicroscopicTexture(String)

//    var errorDescription: String? {
//        switch self {
//        case .wyiParchmentTexture(let msg): return msg
//        case .wyiGranularNoise: return WYISDKConstString.WYI26
//        case .wyiVelvetSoftness: return WYISDKConstString.WYI27
//        case .wyiMarblePattern: return WYISDKConstString.WYI28
//        case .wyiFibrousDetail: return WYISDKConstString.WYI69
//        case .wyiMicroscopicTexture(let msg): return msg
//       
//        }
//    }
}

