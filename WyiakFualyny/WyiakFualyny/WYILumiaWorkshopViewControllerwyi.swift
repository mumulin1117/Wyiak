//
//  WYILumiaWorkshopViewControllerwyi.swift
//  WyiakFualyny
//
//  Created by WyiakFualyny on 2026/2/27.
//

import UIKit

class WYILumiaWorkshoplerwyi: UIViewController {
    
    private let wyiMainScrollView = UIScrollView()
    private let wyiContentContainer = UIView()
    private let wyiVibeSearchField = UISearchBar()
    private let wyiRandomInspireButton = UIButton(type: .system)
    private let wyiBookmarkButton = UIButton(type: .system)
    private let wyiPartnerChatField = UITextField()
    private let wyiSendMessageButton = UIButton(type: .system)
    private let wyiResponseContainer = UIView()
    private let wyiResponseLabel = UILabel()
    private var wyiCardCollection: [UIView] = []
    private let wyiPageControl = UIPageControl()
    
    private var wyiSelectedCardIndex = 0
    private var wyiSavedIndices: [Int] = []
    
    private let wyiInspirationCards: [WYIVisionCardwyi] = [
        WYIVisionCardwyi(title: "Neon Nights", location: "Rooftop Bar", pose: "Over Shoulder", vibe: "Cyberpunk"),
        WYIVisionCardwyi(title: "Forest Whisper", location: "Redwood Forest", pose: "Leaning on Tree", vibe: "Ethereal"),
        WYIVisionCardwyi(title: "Analog Soul", location: "Vintage District", pose: "Walking Away", vibe: "Retro"),
        WYIVisionCardwyi(title: "Coastal Drift", location: "Santa Monica Pier", pose: "Jumping", vibe: "Breezy"),
        WYIVisionCardwyi(title: "Minimal Gaze", location: "White Studio", pose: "Straight On", vibe: "Editorial"),
        WYIVisionCardwyi(title: "Motion Study", location: "Dance Loft", pose: "Arabesque", vibe: "Dynamic"),
        WYIVisionCardwyi(title: "Café Diaries", location: "Local Roasters", pose: "Holding Mug", vibe: "Intimate"),
        WYIVisionCardwyi(title: "Concrete Poems", location: "Abandoned Factory", pose: "Leaning on Wall", vibe: "Gritty")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
       
    }
}
private struct WYIVisionCardwyi {
    let title: String
    let location: String
    let pose: String
    let vibe: String
}
