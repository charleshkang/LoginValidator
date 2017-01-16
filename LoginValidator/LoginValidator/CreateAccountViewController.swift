//
//  CreateAccountViewController
//  LoginValidator
//
//  Created by Charles Kang on 1/15/17.
//  Copyright © 2017 Charles Kang. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordVisibilityToggle: UIButton!
    
    //MARK: Properties
    var toggled = false
    let alertController = AlertController()
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action Methods
    @IBAction func togglePasswordVisibility(_ sender: Any) {
        if !toggled {
            passwordTextField.isSecureTextEntry = false
            passwordVisibilityToggle.setTitle("👁", for: .normal)
            toggled = true
        } else {
            passwordTextField.isSecureTextEntry = true
            passwordVisibilityToggle.setTitle("🙈", for: .normal)
            toggled = false
        }
    }
    
    /* http://stackoverflow.com/questions/37938435/swift-validate-username-input*/
    func isValidInput(input: String) -> Bool {
        let regex = "\\A\\w{6,10}[1-9]\\z"
        let test = NSPredicate(format:"Self Matches %@", regex)
        return test.evaluate(with: input)
    }
    
}

extension CreateAccountViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ passwordTextField: UITextField) -> Bool {
        passwordTextField.resignFirstResponder()
        if isValidInput(input: passwordTextField.text!) {
            // Create the account
            alertController.validAlert()
        } else {
            alertController.invalidAlert()
            return false
        }
        return true
    }
}
