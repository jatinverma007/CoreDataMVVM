//
//  CoreDataFunctions.swift
//  ErouteTech
//
//  Created by jatin verma on 04/05/21.
//

import Foundation
import CoreData
import UIKit


class CoreDataFunctions {
    static func insertEvent(title:String, desc: String, lat: Double, long: Double) {
        
        var User = [NSManagedObject]()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description with your entity name.
        let entity =  NSEntityDescription.entity(forEntityName: "Events",
                                                 in:managedContext)
        
        // Create Managed Objec with help of Entity and Managed Context.
        let userObj = NSManagedObject(entity: entity!,
                                      insertInto: managedContext)
        
        // Set the value for your represent attributes.
        userObj.setValue(title, forKey: "title")
        userObj.setValue(desc, forKey: "notes")
        userObj.setValue(lat, forKey: "latitude")
        userObj.setValue(long, forKey: "longitude")
        
        // Handle the Exception.
        do {
            try managedContext.save() // Save Mangaged Context
            User.append(userObj) // Append your managedObject to the Database.
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func fetchEvents () -> [ENEvent]{
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Events", in: managedContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        var loc = [ENEvent]()
        do {
            let result = try managedContext.fetch(fetchRequest) as?  [Events]
            if (result!.count > 0) {
                for user in result! {
                    let l = ENEvent(title: user.title ?? "", desc: user.notes ?? "", lat: user.latitude, long: user.longitude)
                    loc.append(l)
                }
                
            } else {
                // no
            }
            return loc
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
        
        return []
    }
    
    
    static func insertReminder(title:String, desc: String) {
        
        var User = [NSManagedObject]()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description with your entity name.
        let entity =  NSEntityDescription.entity(forEntityName: "Reminder",
                                                 in:managedContext)
        
        // Create Managed Objec with help of Entity and Managed Context.
        let userObj = NSManagedObject(entity: entity!,
                                      insertInto: managedContext)
        
        // Set the value for your represent attributes.
        userObj.setValue(title, forKey: "title")
        userObj.setValue(desc, forKey: "desc")
        
        // Handle the Exception.
        do {
            try managedContext.save() // Save Mangaged Context
            User.append(userObj) // Append your managedObject to the Database.
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func fetchReminders () -> [ENReminder]{
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Reminder", in: managedContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        var loc = [ENReminder]()
        do {
            let result = try managedContext.fetch(fetchRequest) as?  [Reminder]
            if (result!.count > 0) {
                for user in result! {
                    let l = ENReminder(title: user.title ?? "", desc: user.desc ?? "")
                    loc.append(l)
                }
                
            } else {
                // no
            }
            return loc
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
        
        return []
    }
    
    static func insertAlarm(date:Date, snooze: Bool) {
        
        var User = [NSManagedObject]()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description with your entity name.
        let entity =  NSEntityDescription.entity(forEntityName: "Alarm",
                                                 in:managedContext)
        
        // Create Managed Objec with help of Entity and Managed Context.
        let userObj = NSManagedObject(entity: entity!,
                                      insertInto: managedContext)
        
        // Set the value for your represent attributes.
        userObj.setValue(date, forKey: "date")
        userObj.setValue(snooze, forKey: "snooze")
        
        // Handle the Exception.
        do {
            try managedContext.save() // Save Mangaged Context
            User.append(userObj) // Append your managedObject to the Database.
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    static func fetchAlarms () -> [ENAlarm]{
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Get AppDelegate Object
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Get Managed Context Object with help of AppDelegate.
        let managedContext = appDelegate.managedObjectContext
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Alarm", in: managedContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        var loc = [ENAlarm]()
        do {
            let result = try managedContext.fetch(fetchRequest) as?  [Alarm]
            if (result!.count > 0) {
                for user in result! {
                    let l = ENAlarm(date: user.date ?? Date(), snooze: user.snooze)
                    loc.append(l)
                }
                
            } else {
                // no
            }
            return loc
        } catch {
            let fetchError = error as NSError
            print("Error",fetchError)
        }
        
        return []
    }
}
