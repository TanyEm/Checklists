//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Tanya Tomchuk on 22.02.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import Foundation
import UserNotifications

class ChecklistItem : NSObject, NSCoding {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    override init() {
        // This asks the DataModel object for a new item ID whenever the app creates a new ChecklistItem object.
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        dueDate = aDecoder.decodeObject(forKey: "DueDate") as! Date
        shouldRemind = aDecoder.decodeBool(forKey: "ShouldRemind")
        itemID = aDecoder.decodeInteger(forKey: "ItemID")

        super.init()
        // This is the method for unfreezing the objects from the file.
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
        aCoder.encode(dueDate, forKey: "DueDate")
        aCoder.encode(shouldRemind, forKey: "ShouldRemind")
        aCoder.encode(itemID, forKey: "ItemID")
        // It is method for save text and cheked in Checklist.plist
    }
    
    func scheduleNotification() {
        if shouldRemind && dueDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Reminder:"
            content.body = text
            content.sound = UNNotificationSound.default()
            
            let calendar = Calendar(identifier: .gregorian)
            let components = calendar.dateComponents([.month, .day, .hour, .minute], from: dueDate)
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(identifier: "\(itemID)", content: content, trigger: trigger)
            
            let center = UNUserNotificationCenter.current()
            center.add(request)
            
            print("Scheduled notification \(request) for itemID \(itemID)")
        }
    }
}

