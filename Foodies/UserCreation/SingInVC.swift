//
//  SingInVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 21.11.2022.
//

import UIKit

class SingInVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        signInButton.layer.cornerRadius = 8
        signUpButton.layer.cornerRadius = 8
    }


    @IBAction func signInButtonTapped(_ sender: Any) {
        
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        navigationController?.pushViewController(vc!, animated: true)
    }
}
