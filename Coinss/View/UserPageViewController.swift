//
//  UserPageViewController.swift
//  Coinss
//
//  Created by Nisa Nur Baştimur on 24.04.2024.
//

import UIKit
import Firebase

class UserPageViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var userNameTexfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.layer.cornerRadius = 20
        loginLabel.clipsToBounds = true
        
        signinButton.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        
        title = "User Login"
        
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            self.performSegue(withIdentifier: "toCoinssVC", sender: nil)
        }
        

        
    }
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func showNewPage(_ sender: Any) {
        if userNameTexfield != nil && passwordTextfield != nil {
            
            Auth.auth().signIn(withEmail: userNameTexfield.text!, password: passwordTextfield.text!) { AuthData, error in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "Error")
                    
                }else{
                    self.performSegue(withIdentifier: "toCoinssVC", sender: nil)
                }
            }
            
            
            
        } else {
            makeAlert(title: "error", message: "password/Username")
            
            
        }
        
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        if userNameTexfield.text != ""{
            Auth.auth().createUser(withEmail: userNameTexfield.text!, password: passwordTextfield.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(title: "error", message: error?.localizedDescription ?? "error")
                }else {
                    self.performSegue(withIdentifier: "toCoinssVC", sender: nil)
                    
                }
            }
        }else{
            makeAlert(title: "Error", message: "Username/Password")
        }
        
        
        
    }
    
    
}
