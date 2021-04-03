//
//  View.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 02/04/2021.
//

import SwiftUI

extension View {
    
    ///
    /// Hides the keyboard.
    ///
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
