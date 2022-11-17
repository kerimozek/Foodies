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
        
        randomView.layer.cornerRadius = 10
        randomView.layer.masksToBounds = true
        randomView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        
        randomView.layer.cornerRadius = 15.0
        randomView.layer.borderWidth = 0.0
        randomView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        randomView.layer.shadowOffset = CGSize(width: 0, height: 0)
        randomView.layer.shadowRadius = 5.0
        randomView.layer.shadowOpacity = 1
        randomView.layer.masksToBounds = false
    }

    func configureCell(item: BaseModel) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.randomTitle.text = item.title
        self.randomImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
    
}
