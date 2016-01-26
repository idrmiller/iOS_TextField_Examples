//
//  ZipDelegate.swift
//  iOS_TextField_Delgates
//
//  Created by David Miller on 1/25/16.
//  Copyright © 2016 LM Labs. All rights reserved.
//

import Foundation
import UIKit

class ZipDelegate: NSObject, UITextFieldDelegate {
    
    //TODO: DONE: Limit zip code to 5 charcters only - refrenced (https://stackoverflow.com/questions/25223407/max-length-uitextfield/25224331#25224331)
    //TODO: DONE: Catch exception if user enters no data
    //TODO: DONE: Limit text input to numbers only
    //TODO: DONE: User input is through number pad only
    
    
    //Check max length of text field
    func checkMaxLength(textField: UITextField, maxLength: Int){
        if(textField.text!.characters.count > maxLength){
            textField.deleteBackward()
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var changeText = false
        let maxLength = 5
       
        //Catch exception of 0 or nil input and return max length of text
        let zipText = textField.text?.characters.count
        if zipText == nil{
            print("User alert, need to enter text")
        } else {
            checkMaxLength(textField, maxLength: maxLength)
            changeText = true
        }
        
        return changeText
    }
    
}
