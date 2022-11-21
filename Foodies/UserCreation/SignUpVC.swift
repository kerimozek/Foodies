//
//  SignUpVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 21.11.2022.
//

import UIKit

class SignUpVC: UIViewController {

    
    @IBOutlet weak var nameTxt: UITextField!
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
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
