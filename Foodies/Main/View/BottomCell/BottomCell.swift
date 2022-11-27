//
//  BottomCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 13.11.2022.
//

import UIKit
import Kingfisher

class BottomCell: UICollectionViewCell {

    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var bottomView: DropShadowView!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        bottomView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        bottomView.layer.cornerRadius = 15
        bottomView.layer.shadowColor = UIColor.darkGray.cgColor
        bottomView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        bottomView.layer.shadowRadius = 4.0
        bottomView.layer.shadowOpacity = 0.4
        
        bottomImageView.layer.cornerRadius = 15
        bottomImageView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.clear
    }
    
    
    func configureCell(item: Dinner) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.bottomImageView.kf.setImage(with: URL(string: item.image ?? image))
        self.pointLabel.text = "\(String(describing: item.id))"
        
    }

}
