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
    }
    
    
    func configureCell(item: Recipe) {
        self.titleLabel.text = item.title
        self.bottomImageView.kf.setImage(with: URL(string: item.url))
    }

}
