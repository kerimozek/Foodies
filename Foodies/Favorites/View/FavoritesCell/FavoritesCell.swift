//
//  FavoritesCell.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoritesImageView: UIImageView!
    @IBOutlet weak var favoritesView: DropShadowView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        favoritesView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        favoritesView.layer.cornerRadius = 10
        favoritesView.layer.shadowColor = UIColor.darkGray.cgColor
        favoritesView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        favoritesView.layer.shadowRadius = 4.0
        favoritesView.layer.shadowOpacity = 0.4
        
        favoritesImageView.layer.cornerRadius = 10
        favoritesImageView.clipsToBounds = true
        
        containerView.backgroundColor = UIColor.clear
        
    }
 
    func configureCell(item: Favorite) {
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.titleLabel.text = item.title
        self.favoritesImageView.kf.setImage(with: URL(string: item.image ?? image))
    }
}
