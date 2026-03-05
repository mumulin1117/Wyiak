

import StoreKit

class wyiShearTransformation: NSObject {
    var wyiCompositionGuide: String?
    static let wyiDistortion = wyiShearTransformation()
    private var wyiKeystoneAdjustment: ((Result<Void, Error>) -> Void)?
    private var wyiCoordinateMapping: SKProductsRequest?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func wyiPolygonMesh(wyiFramePadding productID: String, wyiEdgeDetection: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.async {
                wyiEdgeDetection(.failure(NSError(domain: "",
                                            code: -1,
                                                  userInfo: [NSLocalizedDescriptionKey: WyiImageResampling.WYI25])))
            }
            
            return
        }
        
        self.wyiKeystoneAdjustment = wyiEdgeDetection
        wyiCoordinateMapping?.cancel()
        let wyiSko = SKProductsRequest(productIdentifiers: [productID])
        wyiSko.delegate = self
        self.wyiCoordinateMapping = wyiSko
        wyiSko.start()
    }

}

// MARK: - 产品请求
extension wyiShearTransformation: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let wyiPer = response.products.first else {
            DispatchQueue.main.async {
                self.wyiKeystoneAdjustment?(.failure(NSError(domain: "",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: WyiImageResampling.WYI26])))
                self.wyiKeystoneAdjustment = nil
            }
            
            return
        }
        SKPaymentQueue.default().add(SKPayment(product: wyiPer))
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.wyiKeystoneAdjustment?(.failure(error))
            self.wyiKeystoneAdjustment = nil
        }
        
    }
}

// MARK: - 交易回调
extension wyiShearTransformation: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for whyuAllow in transactions {
            switch whyuAllow.transactionState {
            case .purchased:

                self.wyiCompositionGuide = whyuAllow.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(whyuAllow)
                DispatchQueue.main.async {
                    self.wyiKeystoneAdjustment?(.success(()))
                    self.wyiKeystoneAdjustment = nil
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(whyuAllow)
                let e = (whyuAllow.error as? SKError)?.code == .paymentCancelled
                ? NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey: WyiImageResampling.WYI27])
                : (whyuAllow.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: WyiImageResampling.WYI28]))
                DispatchQueue.main.async {
                    self.wyiKeystoneAdjustment?(.failure(e))
                    self.wyiKeystoneAdjustment = nil
                }
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(whyuAllow)
            default:
                break
            }
        }
    }
}

extension wyiShearTransformation {
    
    func wyiGridOverlay() -> Data? {
        guard let wyiurl = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: wyiurl)
    }

    
    
}
