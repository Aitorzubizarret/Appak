//
//  AppakApp.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

@main
struct AppakApp: App {
    
    // MARK: - Properties
    
    var phoneAppsViewModel = PhoneAppsViewModel()
    
    // MARK: - View
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(self.phoneAppsViewModel)
        }
    }
}
