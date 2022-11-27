//
//  SearchCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

    @IBOutlet weak var searchView: DropShadowView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        searchView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        searchView.layer.cornerRadius = 10
        searchView.layer.shadowColor = UIColor.darkGray.cgColor
        searchView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        searchView.layer.shadowRadius = 4.0
        searchView.layer.shadowOpacity = 0.4
        
        searchImageView.layer.cornerRadius = 10
        searchImageView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.clear
       
    }

    func configureCell(item: Search) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.searchImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
    
}
