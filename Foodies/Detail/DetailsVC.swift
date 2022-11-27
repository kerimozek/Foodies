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
    @IBOutlet weak var detailView: UIView!
    
    var detail: BaseModel?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        summaryText.isEditable = false
        servingTime.text = "Serving Time: \(detail?.servings ?? 31) Minutes"
        summaryText.attributedText = detail?.summary?.convertHtmlToAttributedStringWithCSS(font: UIFont(name: "Arial", size: 14), csscolor: "black", lineheight: 5, csstextalign: "left")

        detailTitle.text = detail?.title
        let image = "https://i.dlpng.com/static/png/7210818_preview.png"
        self.detailImage.kf.setImage(with: URL(string: detail?.image ?? image))
        categoryLabel.text = "\(detail?.id ?? 31)"
        
        detailView.backgroundColor = UIColor(red: 0.60, green: 0.66, blue: 0.97, alpha: 1.00)
        detailView.layer.cornerRadius = 10
        detailView.layer.shadowColor = UIColor.darkGray.cgColor
        detailView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        detailView.layer.shadowRadius = 4.0
        detailView.layer.shadowOpacity = 0.4
        
        detailImage.layer.cornerRadius = 10
        detailImage.clipsToBounds = true
    }
}
