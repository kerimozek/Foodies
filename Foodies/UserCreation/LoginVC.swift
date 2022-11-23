//
//  SingInVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 21.11.2022.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = 8
        signUpButton.layer.cornerRadius = 8
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if emailTxt.text != "" && passwordTxt.text != "" {
            Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { authdata, error in
                
                if error != nil {
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                if authdata != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "IntroFirstVC") as? IntroFirstVC
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
            }
        } else {
            showAlert(title: "Error", message: "Username/Pass")
        }
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
        
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }

