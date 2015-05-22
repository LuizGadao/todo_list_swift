//
//  SecondViewController.swift
//  TodoList
//
//  Created by Luiz Carlos Gonçalves dos Anjos on 22/05/15.
//  Copyright (c) 2015 Luiz Carlos Gonçalves dos Anjos. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mTextField: UITextField!
    @IBOutlet weak var btAddItem: UIButton!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        if mTextField.text != ""{
            todoList.append(mTextField.text)
            mTextField.text = ""
        }else{
            println("type something")
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mTextField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

