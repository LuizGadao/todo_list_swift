//
//  FirstViewController.swift
//  TodoList
//
//  Created by Luiz Carlos Gonçalves dos Anjos on 22/05/15.
//  Copyright (c) 2015 Luiz Carlos Gonçalves dos Anjos. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var mTableView: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todoList.removeAtIndex(indexPath.row)
            saveData()
            tableView.reloadData()
        }
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        mTableView.reloadData()
        println(todoList)
        saveData()
    }
    
    func saveData(){
        NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todo-list")
    }
    
    func getData() -> [String]{
        
        var arr = [String]()
        if NSUserDefaults.standardUserDefaults().objectForKey("todo-list") != nil {
            arr =  NSUserDefaults.standardUserDefaults().objectForKey("todo-list") as! [String]
        }
        
        return arr
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todoList = getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

