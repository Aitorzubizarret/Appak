//
//  FieldTitle.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 02/04/2021.
//

import SwiftUI

struct FieldTitle: View {
    
    // MARK: - Properties
    
    var title: String
    
    // MARK: - Methods
    
    init(title: String) {
        self.title = title
    }
    
    // MARK: - View
    
    var body: some View {
        Text(self.title.uppercased())
            .font(Font.system(size: 14))
            .fontWeight(Font.Weight.medium)
            .foregroundColor(Color.black)
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 0))
    }
}

struct FieldTitle_Previews: PreviewProvider {
    static var previews: some View {
        FieldTitle(title: "Field Title")
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
