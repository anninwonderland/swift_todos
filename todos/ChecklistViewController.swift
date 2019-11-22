//
//  ViewController.swift
//  todos
//
//  Created by Ann on 22/11/2019.
//  Copyright © 2019 Ann. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        var msg = ""
        
        
        switch (indexPath.row % 5) {
        case 0:
            msg = "Walk the dog"
        case 1:
            msg = "Brush my teeth"
        case 2:
            msg = "Learn iOS"
        case 3:
            msg = "Practice iOS"
        case 4:
            msg = "Eat"
        default:
            msg = ""
        }
        
        label.text = msg
        return cell
    }
}

