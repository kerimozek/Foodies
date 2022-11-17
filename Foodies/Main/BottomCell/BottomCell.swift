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
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomImageView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        bottomView.clipsToBounds = true
        bottomView.backgroundColor = UIColor(red: 0.95, green: 0.62, blue: 0.21, alpha: 1.00)

        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
    }
    
    
    func configureCell(item: Result) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.bottomImageView.kf.setImage(with: URL(string: item.image ?? image))
        self.pointLabel.text = String(item.id!)
    }

}
