//
//  MainView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct MainView: View {
    
    // Mark: - Properties
    
    var favouriteApps: [PhoneApp] = []
    
    // Mark: - Methods
    
    init() {
        self.addDemoData()
    }
    
    
    ///
    /// Adds demo data.
    ///
    private mutating func addDemoData() {
        let firstApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                          name: "Whatsapp",
                                          urlString: "https://apps.apple.com/es/app/whatsapp-messenger/id310633997")
        let secondApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                           name: "Signal",
                                           urlString: "https://apps.apple.com/es/app/signal-private-messenger/id874139669")
        let thirdApp: PhoneApp = PhoneApp(icon: "applicationIcon",
                                          name: "Whatsapp",
                                          urlString: "https://apps.apple.com/es/app/whatsapp-messenger/id310633997")
        self.favouriteApps.append(firstApp)
        self.favouriteApps.append(secondApp)
        self.favouriteApps.append(thirdApp)
    }
    
    // Mark: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                ListHeaderView()
                ForEach(self.favouriteApps, id:\.id) { phoneApp in
                    AppCellView(phoneApp: phoneApp)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationBarTitle("Appak", displayMode: .automatic)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
