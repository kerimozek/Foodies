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
        topCellImageView.layer.cornerRadius = 8
    }

    func configureCell(item: Recipe) {
        self.nameLabel.text = item.title
        self.topCellImageView.kf.setImage(with: URL(string: item.url))
    }
}
