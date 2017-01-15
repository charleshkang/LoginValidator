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
    
    //MARK: Properties
    var toggled = false
    
    //MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action Methods
    @IBAction func togglePasswordVisibility(_ sender: Any) {
        if !toggled {
            passwordTextField.isSecureTextEntry = false
            toggled = true
        } else {
            passwordTextField.isSecureTextEntry = true
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
            let alert = UIAlertController(title: "Valid Password", message: "Account Created!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Invalid Password", message: "Passwords must be between 6-10 characters and must include an uppercase character and number.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
}
