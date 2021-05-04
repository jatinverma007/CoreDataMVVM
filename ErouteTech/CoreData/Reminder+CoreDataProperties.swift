//
//  Reminder+CoreDataProperties.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//
//

import Foundation
import CoreData


extension Reminder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reminder> {
        return NSFetchRequest<Reminder>(entityName: "Reminder")
    }

    @NSManaged public var title: String?
    @NSManaged public var desc: String?

}

extension Reminder : Identifiable {

}
