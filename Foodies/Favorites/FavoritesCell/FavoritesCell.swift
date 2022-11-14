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
        
    }

    
    
    
}
