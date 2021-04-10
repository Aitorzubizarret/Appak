//
//  AppCellView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct PhoneAppCellView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var phoneAppsViewModel: PhoneAppsViewModel
    var phoneApp: PhoneApp
    
    // MARK: - Methods
    
    init(phoneApp: PhoneApp) {
        self.phoneApp = phoneApp
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationLink(destination: PhoneAppDetailView(phoneApp: self.phoneApp).environmentObject(self.phoneAppsViewModel)) {
            HStack{
                Image(self.phoneApp.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(14)
                Text(self.phoneApp.name.capitalized)
                    .font(Font.system(size: 14))
                    .fontWeight(Font.Weight.medium)
                    .foregroundColor(Color.black)
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
                Spacer()
            }
            .padding(EdgeInsets(top: 6, leading: 12, bottom: 0, trailing: 0))
        }
    }
}

struct PhoneAppCellView_Previews: PreviewProvider {
    static let phoneAppsViewModel = PhoneAppsViewModel()
    
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let phoneApp: PhoneApp = PhoneApp(context: context)
        phoneApp.name = "Demo"
        phoneApp.icon = "applicationIcon"
        phoneApp.urlString = ""
        
        return PhoneAppCellView(phoneApp: phoneApp).environmentObject(phoneAppsViewModel)
            .previewLayout(.sizeThatFits)
    }
}
