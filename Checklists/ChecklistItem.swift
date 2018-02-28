//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Ruth Torres Castillo on 2/21/18.
//  Copyright © 2018 New Mexico State University. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    func toggleChecked(){
        checked = !checked
    }
}
