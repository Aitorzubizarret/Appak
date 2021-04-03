//
//  PhoneAppCreateView.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 02/04/2021.
//

import SwiftUI

struct PhoneAppCreateView: View {
    
    // MARK: - Properties
    
    @Binding var showingPhoneAppCreateView: Bool
    @EnvironmentObject var phoneAppsViewModel: PhoneAppsViewModel
    @State private var fieldAppStoreURL: String = ""
    
    // MARK: - Methods
    
    init(showingPhoneAppCreateView: Binding<Bool>) {
        self._showingPhoneAppCreateView = showingPhoneAppCreateView
    }
    
    ///
    /// Create a PhoneApp with the URL
    ///
    private func createPhoneAppSaveInViewModel() {
        // Check the is data in Field.
        guard self.fieldAppStoreURL != "",
              let url: URL = URL(string: self.fieldAppStoreURL) else { return }
        
        self.getDataFromURL(url) { (success, iconURLString)  in
            if success && (iconURLString != "") {
                let urlParts = self.fieldAppStoreURL.components(separatedBy: "/")
                let phoneAppName: String = urlParts[urlParts.count - 2].capitalized
                
                self.phoneAppsViewModel.createNewPhoneApp(name: phoneAppName, urlString: self.fieldAppStoreURL)
                
                // Dismiss the view.
                self.showingPhoneAppCreateView = false
            } else {
                print("Error createPhoneAppSaveInViewModel - Success -> false")
            }
        }
    }
    
    ///
    /// Get the HTML from the received URL.
    /// Analize that HTML and get the PhoneApp name and icon.
    ///
    private func getDataFromURL(_ url: URL, completionHandler: @escaping(_ success: Bool, _ iconURLString: String) -> Void) {
        do {
            let htmlString: String = try String(contentsOf: url, encoding: .ascii)
            
            // Regex
            let iconImage = htmlString.searchIconImageWithRegex()
            
            completionHandler(true, iconImage)
        } catch let error {
            print("Error getDataFromURL: \(error)")
            completionHandler(false, "")
        }
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                Field(title: "App Store URL", value: self.$fieldAppStoreURL, keyboardType: .URL)
                Button(action: {
                    self.createPhoneAppSaveInViewModel()
                }) {
                    Text("Save App")
                }
            }
            .navigationBarTitle(Text("New App"), displayMode: .inline)
        }
    }
}

struct PhoneAppCreateView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAppCreateView(showingPhoneAppCreateView: .constant(false)).environmentObject(PhoneAppsViewModel())
    }
}
