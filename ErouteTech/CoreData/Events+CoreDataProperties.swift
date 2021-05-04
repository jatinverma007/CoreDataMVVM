//
//  Events+CoreDataProperties.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events")
    }

    @NSManaged public var title: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var notes: String?

}

extension Events : Identifiable {

}
