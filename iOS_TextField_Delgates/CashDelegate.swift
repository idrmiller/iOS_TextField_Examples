//
//  CashDelegate.swift
//  iOS_TextField_Delgates
//
//  Created by David Miller on 1/26/16.
//  Copyright © 2016 LM Labs. All rights reserved.
//

import Foundation
import UIKit

class CashDelegate: NSObject, UITextFieldDelegate {
    
    //TODO: Text field should start with $ sign
    //TODO: Text should always have cents place .00
    //TODO: Default text should be $0.00
    //TODO: Ensure text fills in from right to left
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
         //Set input text to currency formate: Refrenced -- https://stackoverflow.com/questions/26569144/format-currency-in-textfield-in-swift-on-input
        
        //Convert textField.text to NSString due to an error with the use of range to NSRange. This is a legacy code problem with update of new range class by apple, but not updating NSString usage. Refrence: https://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index
        
        let oldText = textField.text! as NSString
        var newText = oldText.stringByReplacingCharactersInRange(range, withString: string) //Creates the new string for display
        var newTextString = newText
        
        let digits = NSCharacterSet.decimalDigitCharacterSet() //Sets the decimal palce
        var digitText = ""
        for characterItem in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(characterItem.value){
                digitText.append(characterItem)
            }
        }
        
        
        let formatter = NSNumberFormatter() //initate NSNumberFormatter
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle //Define number style as currency
        formatter.locale = NSLocale(localeIdentifier: "en_US") //Establish locale currency as English
        let numberFromField = (NSString(string: digitText).doubleValue)/100
        newText = formatter.stringFromNumber(numberFromField)! //Convert number into string to display dollar sign ($)
        
        textField.text = newText
        
        
        
        return false // We keep this block false as to ensure that changes are not overwritten for the entire block.
    }
}
