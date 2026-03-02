//
//  Pay.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/2.
//

import UIKit

class Pay: NSObject {

}
import StoreKit
import UIKit

public class APPPREFIX_AppStorePurchaseMananager: NSObject {

    static let shared = APPPREFIX_AppStorePurchaseMananager()

    private var APPPREFIX_purchaseCompletion: ((Result<Void, Error>) -> Void)?
    private var APPPREFIX_productRequest: SKProductsRequest?
    private var APPPREFIX_pendingTransactionID: String?
    
    // 修复：使用串行队列和原子操作
    private let APPPREFIX_serialQueue = DispatchQueue(label:APPPREFIX_SDKConstString.APPPREFIX_67 )
    private var APPPREFIX_hasCalledBack = false
    private var APPPREFIX_currentProductID: String?

    internal override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
}

// MARK: - Public API
extension APPPREFIX_AppStorePurchaseMananager {

    func APPPREFIX_startPurchase(APPPREFIX_productID: String,
                             APPPREFIX_completion: @escaping (Result<Void, Error>) -> Void) {
        
        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            
            // 检查是否正在处理
            guard !self.APPPREFIX_hasCalledBack, self.APPPREFIX_currentProductID == nil else {
                DispatchQueue.main.async {
                    APPPREFIX_completion(.failure(APPPREFIX_StoreError.APPPREFIX_paymentInProgress))
                }
                return
            }

            guard SKPaymentQueue.canMakePayments() else {
                DispatchQueue.main.async {
                    APPPREFIX_completion(.failure(
                        APPPREFIX_StoreError.APPPREFIX_unavailable(APPPREFIX_SDKConstString.APPPREFIX_25)
                    ))
                }
                return
            }

            // 设置状态
            self.APPPREFIX_hasCalledBack = false
            self.APPPREFIX_currentProductID = APPPREFIX_productID
            self.APPPREFIX_purchaseCompletion = APPPREFIX_completion

            DispatchQueue.main.async {
                self.APPPREFIX_productRequest?.cancel()
                let APPPREFIX_req = SKProductsRequest(productIdentifiers: [APPPREFIX_productID])
                self.APPPREFIX_productRequest = APPPREFIX_req
                APPPREFIX_req.delegate = self
                APPPREFIX_req.start()
            }
        }
    }

    // 其他方法保持不变...
    func APPPREFIX_obtainLocalReceipt() -> Data? {
        guard let url = Bundle.main.appStoreReceiptURL else { return nil }
        return try? Data(contentsOf: url)
    }

    var APPPREFIX_transactionID: String? {
        return APPPREFIX_pendingTransactionID
    }
    
    func APPPREFIX_clearPaymentState() {
        APPPREFIX_serialQueue.async { [weak self] in
            self?.APPPREFIX_hasCalledBack = false
            self?.APPPREFIX_currentProductID = nil
            self?.APPPREFIX_purchaseCompletion = nil
            self?.APPPREFIX_productRequest = nil
        }
    }
}

// MARK: - Private Helpers
extension APPPREFIX_AppStorePurchaseMananager {

    private func complete(_ transaction: SKPaymentTransaction,
                          success: Bool,
                          error: Error? = nil) {
        
        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            
            // 确保只回调一次
            guard !self.APPPREFIX_hasCalledBack else { return }
            self.APPPREFIX_hasCalledBack = true
            
            let completion = self.APPPREFIX_purchaseCompletion
            let productID = self.APPPREFIX_currentProductID
            
            // 清理状态
            self.APPPREFIX_currentProductID = nil
            self.APPPREFIX_purchaseCompletion = nil
            
            DispatchQueue.main.async {
                // 先执行回调
                if success {
                    completion?(.success(()))
                } else {
                    completion?(.failure(error ?? APPPREFIX_StoreError.APPPREFIX_transactionFailed))
                }
                
                // 然后完成交易
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
    }
}

// MARK: - SKProductsRequestDelegate
extension APPPREFIX_AppStorePurchaseMananager: SKProductsRequestDelegate {

    public func productsRequest(_ request: SKProductsRequest,
                         didReceive response: SKProductsResponse) {

        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            
            // 检查是否已经回调过
            guard !self.APPPREFIX_hasCalledBack else { return }

            DispatchQueue.main.async {
                guard let product = response.products.first else {
                    self.APPPREFIX_handleRequestFailure(APPPREFIX_StoreError.APPPREFIX_noProduct)
                    return
                }

                SKPaymentQueue.default().add(SKPayment(product: product))
            }
        }
    }

    public func request(_ request: SKRequest, didFailWithError error: Error) {
        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            guard !self.APPPREFIX_hasCalledBack else { return }
            
            DispatchQueue.main.async {
                self.APPPREFIX_handleRequestFailure(error)
            }
        }
    }
    
    private func APPPREFIX_handleRequestFailure(_ error: Error) {
        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            guard !self.APPPREFIX_hasCalledBack else { return }
            self.APPPREFIX_hasCalledBack = true
            
            let completion = self.APPPREFIX_purchaseCompletion
            self.APPPREFIX_purchaseCompletion = nil
            self.APPPREFIX_currentProductID = nil
            
            DispatchQueue.main.async {
                completion?(.failure(error))
            }
        }
    }
}

// MARK: - SKPaymentTransactionObserver
extension APPPREFIX_AppStorePurchaseMananager: SKPaymentTransactionObserver {

    public func paymentQueue(_ queue: SKPaymentQueue,
                      updatedTransactions transactions: [SKPaymentTransaction]) {
        
        APPPREFIX_serialQueue.async { [weak self] in
            guard let self = self else { return }
            
            for transaction in transactions {
                let productID = transaction.payment.productIdentifier
                
                // 只处理当前商品
                guard productID == self.APPPREFIX_currentProductID else {
                    if transaction.transactionState == .purchased ||
                       transaction.transactionState == .failed ||
                       transaction.transactionState == .restored {
                        DispatchQueue.main.async {
                            SKPaymentQueue.default().finishTransaction(transaction)
                        }
                    }
                    continue
                }

                // 检查是否已经回调过
                guard !self.APPPREFIX_hasCalledBack else {
                    if transaction.transactionState == .purchased ||
                       transaction.transactionState == .failed ||
                       transaction.transactionState == .restored {
                        DispatchQueue.main.async {
                            SKPaymentQueue.default().finishTransaction(transaction)
                        }
                    }
                    continue
                }

                switch transaction.transactionState {
                case .purchased:
                    self.APPPREFIX_pendingTransactionID = transaction.transactionIdentifier
                    self.complete(transaction, success: true)

                case .failed:
                    let finalError: Error
                    if let skError = transaction.error as? SKError, skError.code == .paymentCancelled {
                        finalError = APPPREFIX_StoreError.APPPREFIX_cancelled
                    } else {
                        finalError = transaction.error ?? APPPREFIX_StoreError.APPPREFIX_transactionFailed
                    }
                    self.complete(transaction, success: false, error: finalError)

                case .restored:
                    self.APPPREFIX_pendingTransactionID = transaction.transactionIdentifier
                    self.complete(transaction, success: true)

                case .deferred:
                    // 延迟交易不清理状态，等待最终结果
                    break
                    
                default:
                    break
                }
            }
        }
    }
}

// 错误枚举保持不变...


enum APPPREFIX_StoreError: LocalizedError {
    case APPPREFIX_unavailable(String)
    case APPPREFIX_noProduct
    case APPPREFIX_cancelled
    case APPPREFIX_transactionFailed
    case APPPREFIX_paymentInProgress  // 新增
    case APPPREFIX_deferred(String)   // 新增

    var errorDescription: String? {
        switch self {
        case .APPPREFIX_unavailable(let msg): return msg
        case .APPPREFIX_noProduct: return APPPREFIX_SDKConstString.APPPREFIX_26
        case .APPPREFIX_cancelled: return APPPREFIX_SDKConstString.APPPREFIX_27
        case .APPPREFIX_transactionFailed: return APPPREFIX_SDKConstString.APPPREFIX_28
        case .APPPREFIX_paymentInProgress: return APPPREFIX_SDKConstString.APPPREFIX_69
        case .APPPREFIX_deferred(let msg): return msg
        }
    }
}

