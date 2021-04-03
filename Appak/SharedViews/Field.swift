//
//  Field.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 02/04/2021.
//

import SwiftUI

struct Field: View {
    
    // MARK: - Properties
    
    @Binding var textfieldValue: String
    var title: String
    var keyboardType: UIKeyboardType
    
    // MARK: - Methods
    
    init(title: String, value: Binding<String>, keyboardType: UIKeyboardType) {
        self.title = title
        self._textfieldValue = value
        self.keyboardType = keyboardType
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            FieldTitle(title: self.title)
            TextField("Enter the \(self.title.capitalized) ...", text: $textfieldValue)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                .keyboardType(self.keyboardType)
        }
        .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
        .onTapGesture { self.hideKeyboard() }
    }
}

struct Field_Previews: PreviewProvider {
    static var previews: some View {
        Field(title: "Title", value: .constant("0"), keyboardType: UIKeyboardType.alphabet)
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
