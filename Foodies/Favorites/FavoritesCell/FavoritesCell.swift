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
    @IBOutlet weak var favoritesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        favoritesImageView.layer.cornerRadius = 8
        
        favoritesView.layer.cornerRadius = 10
        favoritesView.layer.masksToBounds = true
        
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 0.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        
    }
 
}
