//
//  ViewController.swift
//  INFO6127-Lab9
//
//  Created by Krunal Shah on 2022-04-06.
//

import UIKit

class ViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    @IBOutlet weak var emailIdText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errorMessageForEmailId: UILabel!
    @IBOutlet weak var errorMessageForPassword: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginButton.isEnabled = (emailIdText.text == nil || passwordText.text == nil)
    }
    
    func checkingValidity()  {
        if let username = emailIdText.text, let password = passwordText.text {
            if !username.isEmpty && !password.isEmpty {
                loginButton.isEnabled = true
            } else {
                loginButton.isEnabled = false
            }
        }
    }
    
    @IBAction func emailIdTextChanged(_ sender: UITextField) {
        checkingValidity()
        
        if let username = emailIdText.text{
            if !username.isEmpty {
                errorMessageForEmailId.isHidden = true
            } else {
                errorMessageForEmailId.isHidden = false
            }
        }
    }
    
    @IBAction func passwordTextChanged(_ sender: UITextField) {
        checkingValidity()
        
        if let password = passwordText.text {
            if !password.isEmpty {
                errorMessageForPassword.isHidden = true
            } else {
                errorMessageForPassword.isHidden = false
            }
        }
    }
    
    @IBAction func onLoginButtonTapped(_ sender: UIButton) {
        if let username = emailIdText.text, let password = passwordText.text {
            
            let alert = UIAlertController(title: "Aleert Message", message: "Authentication Successfull", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default) { _ in
                print("OKAY")
            }
            
            alert.addAction(okButton)
            
            switch(username, password) {
                case ("test1@here.com", "password1"), ("test2@there.com", "2"):
                    self.show(alert, sender: nil)
                
//                    emailIdText.text = nil
//                    passwordText.text = nil
                    break
                
                default:
                    alert.message = "Authentication Failed"
                    self.show(alert, sender: nil)
                
                passwordText.text = nil
                    break
            }
        }
    }
}


