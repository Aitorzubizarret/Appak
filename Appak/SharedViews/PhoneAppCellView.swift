//
//  AppCellView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct PhoneAppCellView: View {
    
    // MARK: - Properties
    
    var phoneApp: PhoneApp
    
    // MARK: - Methods
    
    init(phoneApp: PhoneApp) {
        self.phoneApp = phoneApp
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationLink(destination: PhoneAppDetailView(phoneApp: self.phoneApp)) {
            HStack{
                Image(self.phoneApp.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(14)
                Text(self.phoneApp.name)
                    .font(Font.system(size: 13, weight: .light, design: .default))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                Spacer()
            }
        }
    }
}

struct PhoneAppCellView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let phoneApp: PhoneApp = PhoneApp(context: context)
        phoneApp.name = "Demo"
        phoneApp.icon = "applicationIcon"
        phoneApp.urlString = ""
        
        return PhoneAppCellView(phoneApp: phoneApp)
            .previewLayout(.sizeThatFits)
    }
}
