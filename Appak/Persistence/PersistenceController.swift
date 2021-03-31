//
//  PersistenceController.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 31/03/2021.
//

import SwiftUI
import CoreData

struct PersistenceController {
    
    // Singleton.
    static let shared = PersistenceController()
    
    // Storage for Core Data.
    let container: NSPersistentContainer
    
    // Initializer.
    init() {
        container = NSPersistentContainer(name: "PhoneApp")
        
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    ///
    /// Save the context in Core Data.
    ///
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                print("Error \(error)")
            }
        }
    }
}
