//
//  ViewController.swift
//  todos
//
//  Created by Ann on 22/11/2019.
//  Copyright © 2019 Ann. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [ChecklistItem]()
        
        let rowItem0 = ChecklistItem(text: "eat", checked: true)
        let rowItem1 = ChecklistItem(text: "sleep", checked: false)
        let rowItem2 = ChecklistItem(text: "code", checked: true)
        
        items.append(rowItem0)
        items.append(rowItem1)
        items.append(rowItem2)
        
        
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.isChecked = !item.isChecked
         
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        let item = items[indexPath.row]
        label.text = item.text
        
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        if item.isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

