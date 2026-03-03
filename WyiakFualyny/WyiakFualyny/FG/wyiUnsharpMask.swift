//
//  wyiUnsharpMask.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/3/3.
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
enum WyiCanvasGrain: LocalizedError {
    case wyiEtchingStroke(String)
    case wyiEngravingStyle
    case wyiImpastoStroke
    case wyiGlazeLayer
    case wyiFibrousDetail
    case wyiMicroscopicTexture(String)
}

