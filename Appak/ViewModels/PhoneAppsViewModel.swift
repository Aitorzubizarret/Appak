//
//  PhoneAppsViewModel.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 27/03/2021.
//

import Foundation

class PhoneAppsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var phoneApps: [PhoneApp] = []
    
    // MARK: - Methods
    
    init() {
        self.getPhoneApps()
    }
    
    ///
    /// Get PhoneApps and save them in the property "phoneApps".
    ///
    private func getPhoneApps() {
        // First PhoneApp
        let firstApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                          name: "Whatsapp",
                                          urlString: "https://apps.apple.com/es/app/whatsapp-messenger/id310633997")
        
        // Second PhoneApp
        let secondApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                           name: "Signal",
                                           urlString: "https://apps.apple.com/es/app/signal-private-messenger/id874139669")
        
        // Third PhoneApp
        let thirdApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                          name: "Telegram",
                                          urlString: "https://apps.apple.com/es/app/telegram-messenger/id686449807")
        
        self.phoneApps.append(firstApp)
        self.phoneApps.append(secondApp)
        self.phoneApps.append(thirdApp)
    }
}
