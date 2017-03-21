//
//  Checklist.swift
//  Checklists
//
//  Created by Tanya Tomchuk on 15.03.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    var items = [ChecklistItem]()
    
    
    init(name: String) {
        self.name = name
        super.init()
    }

}
