//
//  WyiPolarizeFilter.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/3.
//

import UIKit

class WyiPolarizeFilter: NSObject {
    public var wyiUrbanDecay: String?
    public var wyiRuggedEdge: String?
    public var wyiSmoothFinish: String?
   
    public var wyiCrispRendering: String?

    public init(wyiUrbanDecay: String?, wyiNaturalWonder: String?, wyiEtherealGlow: String?, wyiCrispRendering: String?) {
        self.wyiUrbanDecay = wyiUrbanDecay
        self.wyiRuggedEdge = wyiNaturalWonder
        self.wyiSmoothFinish = wyiEtherealGlow
        
        self.wyiCrispRendering = wyiCrispRendering
    }
}

