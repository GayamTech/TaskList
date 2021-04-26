//
//  Entry ViewController.swift
//  ToDoList
//
//  Created by Anu Gayam on 4/21/21.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    var update: (() -> Void)?
    
    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        
    }
     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        saveTask()
        
        return  true
    }
    
    @objc func saveTask() {
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
             return
        }
        
        let newCount = count + 1
        
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(text, forKey: "task_\(newCount)")
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    
}
