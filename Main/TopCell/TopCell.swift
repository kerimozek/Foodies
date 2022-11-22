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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        topCellView.layer.cornerRadius = 8
        topCellView.layer.masksToBounds = false
        topCellView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        topCellImageView.layer.cornerRadius = 8
        nameLabel.backgroundColor = UIColor(red: 0.11, green: 0.13, blue: 0.15, alpha: 0.2)
        nameLabel.layer.masksToBounds = true
        nameLabel.layer.cornerRadius = 5
        
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }

    func configureCell(item: Recipe) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.nameLabel.text = item.title
        self.topCellImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
}