//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Ruth Torres Castillo on 2/25/18.
//  Copyright © 2018 New Mexico State University. All rights reserved.
//

import UIKit
protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(
                            _ controller: ItemDetailViewController)
    func itemDetailViewController(
                            _ controller: ItemDetailViewController,
                            didFinishAdding item: ChecklistItem)
    func itemDetailViewController(
                            _ controller: ItemDetailViewController,
                            didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    //MARK:- Actions
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self,
                                    didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    //MARK:- TableView Delegates
    override func tableView(_ tableView: UITableView,
            willSelectRowAt indexPath: IndexPath)
            -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK:- UITextField Delegates
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !(newText.isEmpty)
        return true
    }

   
}
