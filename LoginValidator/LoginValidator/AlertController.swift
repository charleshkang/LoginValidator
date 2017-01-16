//
//  AlertController.swift
//  LoginValidator
//
//  Created by Charles Kang on 1/15/17.
//  Copyright © 2017 Charles Kang. All rights reserved.
//

import Foundation
import UIKit

class AlertController {
    
    //MARK: Action Methods
    func validAlert() {
        let alert = UIAlertController(title: "Valid Password", message: "Account Created!", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    
        alert.show()
        
    }
    
    func invalidAlert() {
        let alert = UIAlertController(title: "Invalid Password", message: "Passwords must be between 6-10 characters and must include an uppercase character and number.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        alert.show()
    }
}
