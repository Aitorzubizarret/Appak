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
        Text(self.title)
    }
}

struct BigButton_Previews: PreviewProvider {
    static var previews: some View {
        BigButton(title: "Button Title")
            .previewLayout(.sizeThatFits)
    }
}
