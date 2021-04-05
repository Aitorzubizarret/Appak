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
    @State private var AppStoreURLChecked: Bool = false
    @State private var fieldAppStoreURL: String = ""
    @State private var phoneAppName: String = ""
    @State private var phoneAppURL: String = ""
    @State private var phoneAppImageURL: String = ""
    
    // MARK: - Methods
    
    init(showingPhoneAppCreateView: Binding<Bool>) {
        self._showingPhoneAppCreateView = showingPhoneAppCreateView
    }
    
    ///
    /// Check the App Store URL introduced by the user.
    ///
    private func checkIntroducedAppStoreURL() -> Bool {
        var response: Bool = false
        
        // Check the field is not empty and the introduced array is a valid URL.
        guard self.fieldAppStoreURL != "",
              let url: URL = URL(string: self.fieldAppStoreURL) else { return response }
        
        // Check the URL is an App Store URL.
        //
        // - https://apps.apple.com/es/app/navegador-firefox/id989804926
        // - https://apps.apple.com/es/app/id989804926
        //
        let urlParts = self.fieldAppStoreURL.components(separatedBy: "/")
        guard urlParts[urlParts.count - 3] == "app",
              urlParts[urlParts.count - 5] == "apps.apple.com" else { return response }
        
        self.getDataFromURL(url) { (success, iconURLString)  in
            if success && (iconURLString != "") {
                
                self.phoneAppName = urlParts[urlParts.count - 2].capitalized
                self.phoneAppURL = self.fieldAppStoreURL
                self.phoneAppImageURL = iconURLString
                
                response = true
            } else {
                print("Error checkIntroducedAppStoreURL - Success -> false")
            }
        }
        
        return response
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
    
    ///
    /// Create a PhoneApp with the URL
    ///
    private func createPhoneAppSaveInViewModel() {
        self.phoneAppsViewModel.createNewPhoneApp(name: self.phoneAppName, urlString: self.phoneAppURL)
        
        // Dismiss the view.
        self.showingPhoneAppCreateView = false
    }
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                Field(title: "App Store URL", value: self.$fieldAppStoreURL, keyboardType: .URL)
                if !self.AppStoreURLChecked {
                    Button(action: {
                        if self.checkIntroducedAppStoreURL() {
                            self.AppStoreURLChecked.toggle()
                        }
                    }) {
                        Text("Check URL")
                    }
                } else {
                    Button(action: {
                        self.createPhoneAppSaveInViewModel()
                    }) {
                        Text("Add App to Appak")
                    }
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
