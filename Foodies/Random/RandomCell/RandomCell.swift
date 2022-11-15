//
//  RandomCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 15.11.2022.
//

import UIKit
import Kingfisher

class RandomCell: UITableViewCell {

    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var randomTitle: UILabel!
    @IBOutlet weak var randomImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        randomImageView.layer.cornerRadius = 8
    }

    func configureCell(item: Recipe) {
        self.randomTitle.text = item.title
        self.randomImageView.kf.setImage(with: URL(string: item.url))
    }
    
}
