//
//  SearchCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        searchImageView.layer.cornerRadius = 10
        searchView.layer.cornerRadius = 10
        searchView.layer.masksToBounds = true
        searchView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)

        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
    
    }

    func configureCell(item: Recipe) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.searchImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
    
}
