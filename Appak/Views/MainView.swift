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
    @State private var showingPhoneAppCreateView: Bool = false
    
    // MARK: - Methods
    
    init() {
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                ListHeaderView()
                ForEach(self.phoneAppsViewModel.phoneApps, id:\.id) { phoneApp in
                    PhoneAppCellView(phoneApp: phoneApp)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationBarTitle("Appak", displayMode: .automatic)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        self.showingPhoneAppCreateView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(Font.system(size: 20, weight: Font.Weight.bold, design: Font.Design.default))
                    }.sheet(isPresented: $showingPhoneAppCreateView, content: {
                        PhoneAppCreateView()
                    })
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static let phoneAppsViewModel = PhoneAppsViewModel()
    
    static var previews: some View {
        MainView().environmentObject(phoneAppsViewModel)
    }
}
