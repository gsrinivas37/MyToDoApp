//
//  FirstViewController.swift
//  My To-Do App
//
//  Created by Gudla Srinivas on 10/17/14.
//  Copyright (c) 2014 sgudla. All rights reserved.
//

import UIKit

 var todoItems: [String] = []

class FirstViewController: UIViewController, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel!.text = todoItems[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        todoItems = []
        
        if var storedTodoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("todolist") {
            for var i=0; i < storedTodoItems.count ; i++ {
                todoItems.append(storedTodoItems[i] as NSString)
            }
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            todoItems.removeAtIndex(indexPath.row)
            
            let fixedTodo = todoItems
            NSUserDefaults.standardUserDefaults().setObject(fixedTodo, forKey: "todolist")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tableView.reloadData()
        }
        
    }
}

