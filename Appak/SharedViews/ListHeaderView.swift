//
//  ListHeaderView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 21/03/2021.
//

import SwiftUI

struct ListHeaderView: View {
    
    // MARK: - Properties
    
    var title: String
    
    // MARK: - Methods
    
    init(title: String) {
        self.title = title
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Text(self.title.capitalized)
                .font(Font.system(size: 20, weight: .bold, design: .default))
            Spacer()
            //Text("See all")
            //    .font(Font.system(size: 16, weight: .light, design: .default))
        }
        .padding(EdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(title: "Title")
            .previewLayout(.sizeThatFits)
    }
}
