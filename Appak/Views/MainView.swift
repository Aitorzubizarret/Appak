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
                HStack(spacing: 0) {
                    AppCellView()
                    AppCellView()
                    AppCellView()
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationTitle("Apps")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
