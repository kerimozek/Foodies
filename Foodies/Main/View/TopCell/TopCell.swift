//
//  TopCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 13.11.2022.
//

import UIKit
import Kingfisher

class TopCell: UICollectionViewCell {

    @IBOutlet weak var topCellImageView: UIImageView!
    @IBOutlet weak var topCellView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: DropShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        topCellView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        topCellView.layer.cornerRadius = 10
        topCellView.layer.shadowColor = UIColor.darkGray.cgColor
        topCellView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        topCellView.layer.shadowRadius = 4.0
        topCellView.layer.shadowOpacity = 0.4
        
        topCellImageView.layer.cornerRadius = 10
        topCellImageView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.clear
    }

    func configureCell(item: Sweets) {
        let image = "https://food-images.files.bbci.co.uk/food/recipes/one_pan_saltimbocca_alla_71615_16x9.jpg"
        self.nameLabel.text = item.title
        self.topCellImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
}
