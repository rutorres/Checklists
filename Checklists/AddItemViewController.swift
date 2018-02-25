//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Ruth Torres Castillo on 2/25/18.
//  Copyright © 2018 New Mexico State University. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

   
}
