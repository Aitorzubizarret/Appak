//
//  MainView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var phoneAppsViewModel: PhoneAppsViewModel
    
    // MARK: - Methods
    
    init() {
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                ListHeaderView()
                ForEach(self.phoneAppsViewModel.phoneApps, id:\.id) { phoneApp in
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
