//
//  Alarm+CoreDataProperties.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var date: Date?
    @NSManaged public var snooze: Bool

}

extension Alarm : Identifiable {

}
