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
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomImageView.layer.cornerRadius = 10
        bottomView.layer.cornerRadius = 10
        bottomView.clipsToBounds = true

        // Configure the cell
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
    }
    
    
    func configureCell(item: Result, indexPath: IndexPath) {
        self.titleLabel.text = item.title
        self.bottomImageView.kf.setImage(with: URL(string: item.image!))
    }

}
