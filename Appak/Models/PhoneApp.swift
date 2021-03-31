//
//  PhoneApp.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 21/03/2021.
//

import CoreData

class PhoneApp: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var icon: String
    @NSManaged var name: String
    @NSManaged var urlString: String
}
