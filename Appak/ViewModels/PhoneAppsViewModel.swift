//
//  PhoneAppsViewModel.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 27/03/2021.
//

import Foundation
import SwiftUI
import CoreData

class PhoneAppsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var phoneApps: [PhoneApp] = []
    let persistenceController = PersistenceController.shared
    private var moc: NSManagedObjectContext
    
    // MARK: - Methods
    
    init() {
        // Get the MOC (Managed Object Context).
        self.moc = self.persistenceController.container.viewContext
        
        //self.saveDemoPhoneApps()
        self.getPhoneApps()
    }
    
    ///
    /// Get PhoneApps from Core Data and save them in the property "phoneApps".
    ///
    private func getPhoneApps() {
        let request = PhoneApp.fetchRequest()
        
        do {
            var fetchedPhoneApps: [PhoneApp] = []
            fetchedPhoneApps = try self.moc.fetch(request) as! [PhoneApp]
            
            self.phoneApps = fetchedPhoneApps
        } catch let error {
            print("VM getPhoneApps Error: \(error)")
        }
    }
    
    ///
    /// Create a Demo PhoneApps and save it in CoreData.
    ///
    private func saveDemoPhoneApps() {
        // Create new PhoneApp object.
        let newPhoneApp: PhoneApp = PhoneApp(context: self.moc)
        newPhoneApp.id = UUID()
        newPhoneApp.icon = "applicationIcon"
        newPhoneApp.name = "Signal"
        newPhoneApp.urlString = "https://apps.apple.com/es/app/signal-private-messenger/id874139669"
        
        do {
            try self.moc.save()
        } catch let error {
            print("VM saveDemoPhoneApps error: \(error.localizedDescription)")
        }
    }
    
    ///
    /// Create a new PhoneApp and save it in Core Data.
    ///
    func createNewPhoneApp(name: String, urlString: String) {
        // Create new PhoneApp object.
        let newPhoneApp: PhoneApp = PhoneApp(context: self.moc)
        newPhoneApp.id = UUID()
        newPhoneApp.icon = "applicationIcon"
        newPhoneApp.name = name
        newPhoneApp.urlString = urlString
        
        // Save the new PhoneApp in Core Data and update the PhoneApps property.
        do {
            try self.moc.save()
            self.getPhoneApps()
        } catch let error {
            print("VM createNewPhoneApp error: \(error.localizedDescription)")
        }
    }
    
    ///
    /// Delete the received PhoneApp from Core Data.
    /// - Parameter phoneApp: The PhoneApp object.
    ///
    public func deletePhoneApp(phoneApp: PhoneApp) {
        self.moc.delete(phoneApp)
        
        do {
            try self.moc.save()
            self.getPhoneApps()
        } catch let error {
            print("Error deleting the PhoneApp: \(error)")
        }
    }
}
