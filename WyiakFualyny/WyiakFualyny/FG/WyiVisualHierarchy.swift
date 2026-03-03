//
//  WyiVisualHierarchy.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/3/3.
//

import UIKit
 class wyiVisualHierarchy: NSObject {
    public var wyiAtmosphericHaze: String
    public var wyiSilhouetteEdge: String
    public var wyiContrastRatio: String

    public init(wyiVisualHierarchy: String, wyiAtmosphericHaze: String, wyiSilhouetteEdge: String) {
        self.wyiAtmosphericHaze = wyiVisualHierarchy
        self.wyiSilhouetteEdge = wyiAtmosphericHaze
        self.wyiContrastRatio = wyiSilhouetteEdge
    }
}
