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
    
    @State private var showRecommended = false
    
    // MARK: - Methods
    
    // MARK: - View
    
    var body: some View {
        VStack {
            Button("Show App Store Banner") {
                showRecommended.toggle()
            }
            .appStoreOverlay(isPresented: $showRecommended) {
                SKOverlay.AppConfiguration(appIdentifier: "871799243", position: .bottom)
            }
            Button(action: {
                if let url = URL(string: "https://apps.apple.com/es/app/bizkaibus/id871799243"),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:]) { (success) in
                        if success {
                            print("Success")
                        }
                    }
                }
            }) {
                Text("Go to App Store")
            }
        }
    }
}

struct PhoneAppDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAppDetailView()
    }
}
