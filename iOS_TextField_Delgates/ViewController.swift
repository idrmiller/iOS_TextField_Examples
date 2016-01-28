//
//  ViewController.swift
//  iOS_TextField_Delgates
//
//  Created by David Miller on 1/25/16.
//  Copyright © 2016 LM Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockTextField: UITextField!
    @IBOutlet weak var lockSwitch: UISwitch!
    
    let zipDelegate = ZipDelegate()
    let cashDelegate = CashDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.zipTextField.delegate = zipDelegate
        self.cashTextField.delegate = cashDelegate
        lockSwitchAction(lockSwitch)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func lockSwitchAction(sender: UISwitch) {
        
        if sender.on == true {
            lockTextField.enabled = true
        } else {
            lockTextField.enabled = false
            lockTextField.resignFirstResponder()
        }
        
    }


}

