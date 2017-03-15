//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Tanya Tomchuk on 22.02.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject, NSCoding {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
        // It is metod for save text and cheked in Checklist.plist
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override init() {
        super.init()
    }

}

