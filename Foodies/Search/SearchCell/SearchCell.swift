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

        
        searchView.layer.cornerRadius = 15.0
        searchView.layer.borderWidth = 0.0
        searchView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        searchView.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchView.layer.shadowRadius = 5.0
        searchView.layer.shadowOpacity = 1
        searchView.layer.masksToBounds = false
    
    }

    func configureCell(item: Recipe) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.searchImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
    
}
