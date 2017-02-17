//
//  ViewController.swift
//  Checklists
//
//  Created by Tanya Tomchuk on 16.02.17.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItemCell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
//        if indexPath.row == 0 {
//            label.text = "Cook breakfast"
//        } else if indexPath.row == 1 {
//            label.text = "Brush my teeth"
//        } else if indexPath.row == 2 {
//            label.text = "Learn iOS development"
//        } else if indexPath.row == 3 {
//            label.text = "Workout"
//        } else if indexPath.row == 4 {
//            label.text = "Learn English language"
//        }
        
        if indexPath.row % 5 == 0 {
            label.text = "Cook breakfast"
        } else if indexPath.row % 5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row % 5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row % 5 == 3 {
            label.text = "Workout"
        } else if indexPath.row % 5 == 4 {
            label.text = "Learn English language"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

}

