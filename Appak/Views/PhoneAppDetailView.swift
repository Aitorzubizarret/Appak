//
//  PhoneAppDetailView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 01/04/2021.
//

import SwiftUI
import StoreKit // SKOverlay, SKStoreProductViewController

struct PhoneAppDetailView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var phoneAppsViewModel: PhoneAppsViewModel
    @State private var showRecommended = false
    var phoneApp: PhoneApp
    
    // MARK: - Methods
    
    init(phoneApp: PhoneApp) {
        self.phoneApp = phoneApp
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Button(action: {
                showRecommended.toggle()
            }) {
                BigButton(title: "Show App Store Banner")
            }
            .appStoreOverlay(isPresented: $showRecommended) {
                SKOverlay.AppConfiguration(appIdentifier: "871799243", position: .bottom)
            }
            Button(action: {
                if let url = URL(string: self.phoneApp.urlString),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:]) { (success) in
                        if success {
                            print("Success")
                        }
                    }
                }
            }) {
                BigButton(title: "Go to App Store")
            }
            Button(action: {
                self.phoneAppsViewModel.deletePhoneApp(phoneApp: self.phoneApp)
            }) {
                BigButton(title: "Delete App")
            }
        }
    }
}

struct PhoneAppDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let phoneApp: PhoneApp = PhoneApp(context: context)
        phoneApp.name = "Demo"
        phoneApp.icon = "applicationIcon"
        phoneApp.urlString = ""
        
        return PhoneAppDetailView(phoneApp: phoneApp)
    }
}
