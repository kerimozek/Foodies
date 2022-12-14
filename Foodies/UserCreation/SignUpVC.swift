//
//  SignUpVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 21.11.2022.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {

    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        signUpButton.layer.cornerRadius = 8
        dismissButton.layer.cornerRadius = 8
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if emailTxt.text != "" && passwordTxt.text != "" {
            Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { authdata, error in
                if error != nil {
                    self.showAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }
                if authdata != nil {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            showAlert(title: "Error", message: "Username/Pass")
        }
    }
        
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
