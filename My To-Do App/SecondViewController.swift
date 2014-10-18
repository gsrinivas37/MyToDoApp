//
//  SecondViewController.swift
//  My To-Do App
//
//  Created by Gudla Srinivas on 10/17/14.
//  Copyright (c) 2014 sgudla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var todoText: UITextField!
    @IBAction func addItem(sender: AnyObject) {
        todoItems.append(todoText.text)
        todoText.resignFirstResponder()
        
        let fixedTodo = todoItems
        NSUserDefaults.standardUserDefaults().setObject(fixedTodo, forKey: "todolist")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        todoText.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}

