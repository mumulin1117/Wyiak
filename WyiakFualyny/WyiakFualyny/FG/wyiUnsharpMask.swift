//
//  wyiUnsharpMask.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/3.
//

import UIKit
class wyiUnsharpMask: NSObject {
    public var wyiVignetteStrength: String
    public var wyiClarityEnhancement: String
    public var wyiPosterizeEffect: String
    public init(wyiVignetteStrength: String,wyiClarityEnhancement:String,wyiPosterizeEffect:String) {
        self.wyiVignetteStrength = wyiVignetteStrength
        self.wyiClarityEnhancement = wyiClarityEnhancement
        self.wyiPosterizeEffect = wyiPosterizeEffect
    }
}
