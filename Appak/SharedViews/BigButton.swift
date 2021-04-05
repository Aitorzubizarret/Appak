//
//  BigButton.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 05/04/2021.
//

import SwiftUI

struct BigButton: View {
    
    // MARK: - Properties
    
    var title: String
    
    // MARK: - Methods
    
    init(title: String) {
        self.title = title
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Spacer()
            Text(self.title)
                .font(Font.system(size: 14))
                .fontWeight(Font.Weight.medium)
            Spacer()
        }
        .padding()
        .background(Color.white)
        .foregroundColor(Color.gray)
        .font(.headline)
        .cornerRadius(6)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 24))
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(title: "Button Title")
            .previewLayout(.sizeThatFits)
    }
}
