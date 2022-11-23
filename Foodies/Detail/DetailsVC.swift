//
//  DetailsVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 18.11.2022.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {
 
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var servingTime: UILabel!
    @IBOutlet weak var isVeganImage: UIImageView!
    @IBOutlet weak var summaryText: UITextView!
    
    var detail: BaseModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        servingTime.text = "\(String(describing: detail?.servings))"
        summaryText.text = detail?.summary
        detailImage.layer.cornerRadius = 10
        detailTitle.text = detail?.title
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.detailImage.kf.setImage(with: URL(string: detail?.image ?? image))
        categoryLabel.text = "\(String(describing: detail?.id)))"
    }
}
