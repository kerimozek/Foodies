//
//  RandomCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import UIKit
import Kingfisher

class RandomCell: UITableViewCell {

    @IBOutlet weak var randomView: DropShadowView!
    @IBOutlet weak var randomTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var randomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        randomView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        randomView.layer.cornerRadius = 10
        randomView.layer.shadowColor = UIColor.darkGray.cgColor
        randomView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        randomView.layer.shadowRadius = 4.0
        randomView.layer.shadowOpacity = 0.4
        
        randomImageView.layer.cornerRadius = 10
        randomImageView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.clear
    }

    func configureCell(item: BaseModel) {
        let image = "https://food-images.files.bbci.co.uk/food/recipes/one_pan_saltimbocca_alla_71615_16x9.jpg"
        self.randomTitle.text = item.title
        self.randomImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
    
}
