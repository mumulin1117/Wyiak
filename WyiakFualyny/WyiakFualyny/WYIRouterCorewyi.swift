//
//  WYIRouterCorewyi.swift
//  WyiakFualyny
//
//  Created by mumu on 2026/2/8.
//

import UIKit

enum WYIRouterCorewyi {
    
    enum RouteTargetwyi: String, CaseIterable {
        case wyiAIEditor = "ivY7tXzIaCFYkSWNj541X3I2j+CAUe3EIezvxWIrPXKZ5agyTde1S8LSK2XItPgNqTDrtLz8yJM="
        case wyiRoomCreator = "d+9+AnKT8SROZe4Q9CSxm35JHbaQjU7CvveP0wJpXsveqIKjpesECSWt8DDXqtZQtStbFIgNCA=="
        case wyiLiveJoin =  "9F9w6dpRzenl2NrXRcUoVMbRTbWQsBbYK5DU0FUc7sZ3hUxcJ9YRue2ekGz+GoZdF45px+df+IzsP9pLI4gFiTUs1rBGl05dng=="
        case wyiVirtualChat =  "/Qzb74Cax8qcnOsySvKmAFHRaIRnpQStOHGktQoV0OSUBk2UvalFj1NB3DTeOsZvQWvmPEZR8m96RoRmk7kxC7KdXA=="
        case wyiAIRobot =  "wdOzKGd87zsq8ym+LJnAEMrm5iEp81r6e6rectHc5pRnWSxLIwOSJtS+cNA7OQ/oLwVzNA=="
        case wyiMessageDetail =  "4u05nujGwP+hfTRF5MntS1htWUt1OuTIuSSCCOJJF/bitiK4+D3+VheP0xHyCD8YnONADdmik90uwytnuH97pvY="
        case wyiNotificationHub =  "lFXjeqGuDwTUOFVpXICSJw4Z0X7lMv4Ig4qC5dAS5amgjtnZCA3vMLj9v+aqjXjpKlqI"
        case wyiUserProfile =  "xZoTnUL3gwjxSyW/uYJqKz3VxPciXh+V4m7Xw1Asyi7lJINzjy2wQMHV/p3dCWlYGMef6UTRqOq+vxr5"
        case wyiDynamicDetail =  "P/KDKbaSIgEPJhm2TCO6qAgSwI93EL9imEGODHYn4FI6Trf4bo0g/kOeO1KEXL8L6ijDQqFw3ADKmbvoEwsk13VvDDN2"
        case wyiContentPublisher = "MF/WESHf9O/drIaoiWQfKTLUnWXK2Qwo1rbEG5pGDLSagIdzlgcIHzXLxt2222ZJ1wE="
        case wyiVideoPublisher =  "ic+vRWpQMHyHoxWFfOtg/z88wN5Pz8D/EEnUfhYmOZyESEw1JZcRkRb+oZCSup0ihiRVCyqyag=="
        case wyiVideoDetail =  "5RsU2zsiIm9aLDX26etd+jEPfOa98dYDbobBSmiCPTibsNWi63eCqreAnFn3sJzf0YYyQBPbuV2N7XPNWYiyr5JV6A=="
        case wyiSettingsPanel = "sZosO/o2X/w127dXAmlalD4YXdnJi5duB2BOxP8OlmgoUDRoH6PaU7FMxiJ9BnfDMwS+LA=="
        case wyiFollowingList = "fFE3IiOJ3FKftkGdY6y3A67ds+KObOyjJElyxz38XA1InzX8959LNk0hOmlBElMh61rZCXaL"
        case wyiFollowerList = "aTtPiaBl9R+62PZ7xbd8TeEe0Gpi1ilyyk4KWWLlDwKo+1VTRStTbAUeQJdi+GN5rR7VN2k="
        case wyiReportInterface =  "qvytbKZ8+qs6Cul2kAcVETj3e4XKKw0PsXU6539CITGdUBcu5AZg2obhyN2SG7+tH1Bi"
        case wyiWalletView = "ZS16VdUUAhV7XO9h7Bj1sdcEsTSs0TswE/WcGBke6H897Iak6GKryTy68+fWDj3xErkigFw="
        case wyiTermsAgreement =  "VATJ9NBe3Bz9VS4OrB6S1/vYOLPdtkZiqgxP2qxwito7d/aj+DaN0qZgvbszJEvxKI2vwZO0yzaO2W4c"
        case wyiPrivacyAgreement =  "tsXHHqPniU1t5nzzmovV8gcQ5H/n0+ZlT4GziHJRBFvEs4K1t5RRzpHkw2lTGNAqqYiUTEa4mzdW+VYW"
        case wyiGiftHistory =  "212B/9RTZP454YZqvJVeanhGPB2R+Ww/HaU51xg5MEsX4AKi4gZlUS/rOELMuKIk7wEzsSaOb3D149nyJuSGKw=="
        case wyiEmptyRoute = ""
        
        var wyiRouteTypeValue: Int {
            switch self {
            case .wyiAIEditor, .wyiAIRobot:
                return 101
            case .wyiRoomCreator, .wyiLiveJoin, .wyiVirtualChat:
                return 102
            case .wyiMessageDetail, .wyiNotificationHub, .wyiUserProfile:
                return 103
            case .wyiDynamicDetail, .wyiContentPublisher:
                return 104
            case .wyiVideoPublisher, .wyiVideoDetail:
                return 105
            case .wyiSettingsPanel, .wyiWalletView:
                return 106
            case .wyiFollowingList, .wyiFollowerList, .wyiReportInterface:
                return 107
            case .wyiTermsAgreement, .wyiPrivacyAgreement:
                return 108
            case .wyiGiftHistory:
                return 109
            case .wyiEmptyRoute:
                return 0
            }
        }
    }
    
    enum RouteCategorywyi: Int {
        case wyiAIType = 101
        case wyiRoomType = 102
        case wyiSocialType = 103
        case wyiContentType = 104
        case wyiVideoType = 105
        case wyiAccountType = 106
        case wyiListType = 107
        case wyiLegalType = 108
        case wyiGiftType = 109
        case wyiEmptyType = 0
    }
    
  
    
    struct RouteConstructorwyi {
     
        private let wyiSessionHandler: SessionHandlerwyi
        private var wyiRequestMarker: String
        
        
        
        func wyiGenerateRoutePath(target: RouteTargetwyi,
                                queryString: String = "",
                                extraParameters: [String: String] = [:]) -> String {
            
            if target == .wyiEmptyRoute {
                return wyiProcessEmptyTarget()
            }
            
            let baseSegment = wyiAssembleBaseSegment(target: target, query: queryString)
            let enhancedSegment = wyiAugmentWithParameters(baseSegment: baseSegment,
                                                         extras: extraParameters)
            
            return wyiFinalizeRoute(enhancedSegment: enhancedSegment)
        }
        
        private func wyiAssembleBaseSegment(target: RouteTargetwyi, query: String) -> String {
            let rawSegment = target.rawValue
            let authToken = wyiSessionHandler.wyiFetchAuthToken()
            
            var segmentComponents = [String]()
            segmentComponents.append(rawSegment)
            
            if !query.isEmpty {
                let processedQuery = wyiTransformQuery(query)
                segmentComponents.append(processedQuery)
            }
            
            if !authToken.isEmpty {
                segmentComponents.append("&token=\(authToken)")
            }
            
            return segmentComponents.joined()
        }
        
        private func wyiAugmentWithParameters(baseSegment: String,
                                            extras: [String: String]) -> String {
            var workingSegment = baseSegment
            
            
            let timeValue = Int(Date().timeIntervalSince1970)
//            workingSegment += "&_t=\(timeValue)"
            
            for (paramKey, paramValue) in extras {
                if !paramValue.isEmpty {
                    workingSegment += "&\(paramKey)=\(paramValue)"
                }
            }
            
            return workingSegment
        }
        
        private func wyiFinalizeRoute(enhancedSegment: String) -> String {
            let gateway = "wyiCurrentConfig.wyiGatewayEndpoint"
            let processedSegment = wyiApplyRedundantProcessing(enhancedSegment)
            return gateway + processedSegment
        }
        
        private func wyiProcessEmptyTarget() -> String {
            return "wyiCurrentConfig.wyiGatewayEndpoint"
        }
        
        private func wyiTransformQuery(_ query: String) -> String {
            var transformed = query
            
            if !transformed.hasPrefix("&") && !transformed.isEmpty {
                transformed = "&" + transformed
            }
            
            transformed = transformed.replacingOccurrences(of: " ", with: "+")
            
            return transformed
        }
        
        private func wyiApplyRedundantProcessing(_ input: String) -> String {
            let stepOne = input
            let stepTwo = stepOne.trimmingCharacters(in: .whitespacesAndNewlines)
            let stepThree = stepTwo
            
            SessionHandlerwyi.sharedInstance.wyiRecordProcessingEvent(for: wyiRequestMarker)
            
            return stepThree
        }
    }
    
    class SessionHandlerwyi {
        static let sharedInstance = SessionHandlerwyi()
        private init() {
            wyiInitializeHandler()
        }
        
        private let wyiStorageKey = "highSpeedwyi"
        private var wyiTokenCache: [String: Any] = [:]
        private var wyiAccessHistory: [(Date, String)] = []
        
         func wyiFetchAuthToken() -> String {
            if let cachedValue = wyiTokenCache[wyiStorageKey] as? String {
                wyiLogAccessEvent("cache_access")
                return cachedValue
            }
            
            if let storedValue = UserDefaults.standard.object(forKey: wyiStorageKey) as? String {
                wyiTokenCache[wyiStorageKey] = storedValue
                wyiLogAccessEvent("storage_access")
                return storedValue
            }
            
            wyiLogAccessEvent("no_token")
            return ""
        }
        
        private func wyiUpdateAuthToken(_ tokenValue: String?) {
            UserDefaults.standard.set(tokenValue, forKey: wyiStorageKey)
            
            if let tokenValue = tokenValue {
                wyiTokenCache[wyiStorageKey] = tokenValue
            } else {
                wyiTokenCache.removeValue(forKey: wyiStorageKey)
            }
            
            wyiLogAccessEvent("token_update")
            wyiExecuteCleanupProcedure()
        }
        
        static var wyiCurrentToken: String? {
            get {
                return sharedInstance.wyiFetchAuthToken()
            }
            set {
                sharedInstance.wyiUpdateAuthToken(newValue)
            }
        }
        
        private func wyiInitializeHandler() {
            if let token = UserDefaults.standard.object(forKey: wyiStorageKey) as? String {
                wyiTokenCache[wyiStorageKey] = token
            }
            
            wyiScheduleMaintenanceTimer()
        }
        
        private func wyiLogAccessEvent(_ eventCode: String) {
            let historyEntry = (Date(), eventCode)
            wyiAccessHistory.append(historyEntry)
            
            if wyiAccessHistory.count > 100 {
                wyiAccessHistory.removeFirst(50)
            }
        }
        
        private func wyiExecuteCleanupProcedure() {
            if wyiAccessHistory.count > 80 {
                wyiAccessHistory.removeAll { entry in
                    entry.0.timeIntervalSinceNow < -3600
                }
            }
        }
        
        private func wyiScheduleMaintenanceTimer() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 300) { [weak self] in
                self?.wyiExecuteCleanupProcedure()
                self?.wyiScheduleMaintenanceTimer()
            }
        }
        
        func wyiRecordProcessingEvent(for requestId: String) {
            let eventCode = "processing_\(requestId.prefix(8))"
            wyiLogAccessEvent(eventCode)
        }
    }
    
    static func wyiCreatePathForRoute(routeIdentifier: String, queryString: String = "") -> String {
        struct RouteConfigwyi {
            let wyiGatewayEndpoint: String
            let wyiApplicationIdentifier: String
            let wyiVersionMarker: String
            let wyiDevicePlatform: String
            
            static let wyiPrimaryConfig = RouteConfigwyi(
                wyiGatewayEndpoint: "https://f8g6h4j2l0n8b6v4c2x0z.shop/#",
                wyiApplicationIdentifier: "60420695",
                wyiVersionMarker: "1.0",
                wyiDevicePlatform: "iOS"
            )
        }
        let stepOne = RouteConfigwyi.wyiPrimaryConfig.wyiGatewayEndpoint
        let stepTwo = SessionHandlerwyi.wyiCurrentToken ?? ""
        let stepfour = RouteConfigwyi.wyiPrimaryConfig.wyiApplicationIdentifier
        
        let wyawag = String(
            format: "%@%@%@&token=%@&appID=%@",
            stepOne,
            routeIdentifier,
            queryString,
            stepTwo,
            stepfour
        )
        
        return wyawag
        
       
    }

    
    static var wyiSessionToken: String? {
        get {
            return SessionHandlerwyi.wyiCurrentToken
        }
        set {
            SessionHandlerwyi.wyiCurrentToken = newValue
        }
    }
}

