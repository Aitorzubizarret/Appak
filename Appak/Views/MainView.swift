//
//  MainView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 19/03/2021.
//

import SwiftUI

struct MainView: View {
    
    // Mark: - Properties
    
    // Mark: - Methods
    
    // Mark: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                ListHeaderView()
                HStack(spacing: 8) {
                    AppCellView()
                    AppCellView()
                    AppCellView()
                    AppCellView()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationBarTitle("Appak", displayMode: .inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
