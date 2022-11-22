//
//  IntroFirstVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 22.11.2022.
//

import UIKit

class IntroFirstVC: UIViewController {
    
    @IBOutlet weak var firstIntroImageView: UIImageView!
    @IBOutlet weak var firstIntroButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstGif = UIImage.gifImageWithName("firstIntroGif")
        firstIntroImageView.image = firstGif
        firstIntroButton.layer.cornerRadius = 8
    }
    
    @IBAction func firstIntroButtonTapped(_ sender: Any) {
        let vc = (storyboard?.instantiateViewController(withIdentifier: "IntroSecondVC") as? IntroSecondVC)!
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
