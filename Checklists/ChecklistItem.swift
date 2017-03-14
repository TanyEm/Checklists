//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Tanya Tomchuk on 22.02.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }

}
