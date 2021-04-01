//
//  AppCellView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct AppCellView: View {
    
    // MARK: - Properties
    
    private var cellSize: CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width - 40
        let cellSize: CGSize = CGSize(width: screenWidth / 4, height: 110)
        return cellSize
    }
    var phoneApp: PhoneApp
    
    // MARK: - Methods
    
    init(phoneApp: PhoneApp) {
        self.phoneApp = phoneApp
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationLink(destination: PhoneAppDetailView()) {
            VStack{
                Image(self.phoneApp.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center)
                    .cornerRadius(14)
                Text(self.phoneApp.name)
                    .font(Font.system(size: 13, weight: .light, design: .default))
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
            }
            .frame(width: cellSize.width, height: cellSize.height, alignment: .center)
        }
    }
}

struct AppCellView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let phoneApp: PhoneApp = PhoneApp(context: context)
        phoneApp.name = "Demo"
        phoneApp.icon = "applicationIcon"
        phoneApp.urlString = ""
        
        return AppCellView(phoneApp: phoneApp)
            .previewLayout(.sizeThatFits)
    }
}
