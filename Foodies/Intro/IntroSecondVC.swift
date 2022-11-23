//
//  IntroSecondVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 22.11.2022.
//

import UIKit

class IntroSecondVC: UIViewController {

    @IBOutlet weak var secondIntroButton: UIButton!
    @IBOutlet weak var secondIntroImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let firstGif = UIImage.gifImageWithName("secondIntroGif")
        secondIntroImageView.image = firstGif
        secondIntroButton.layer.cornerRadius = 8
    }
    

    @IBAction func secondIntroButtonTapped(_ sender: Any) {
        
        let board = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = board.instantiateViewController(withIdentifier: "tabBar")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBar)
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
//        navigationController?.pushViewController(vc!, animated: true)
    }
    

}
