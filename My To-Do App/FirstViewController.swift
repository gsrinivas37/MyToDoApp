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

}

