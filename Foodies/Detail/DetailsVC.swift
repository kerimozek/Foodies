//
//  DetailsVC.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 18.11.2022.
//

import UIKit
import Kingfisher
import Firebase
import FirebaseFirestore

class DetailsVC: UIViewController {
 
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var servingTime: UILabel!
    @IBOutlet weak var isVeganImage: UIImageView!
    @IBOutlet weak var summaryText: UITextView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var buttonSave: UIButton!
    var detail: BaseModel?
    var db = Firestore.firestore()
    
    
    private var control = false
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        summaryText.isEditable = false
        servingTime.text = "Serving Time: \(detail?.servings ?? 31) Minutes"
        summaryText.attributedText = detail?.summary?.convertHtmlToAttributedStringWithCSS(font: UIFont(name: "Arial", size: 14), csscolor: "black", lineheight: 5, csstextalign: "left")
        buttonSave.layer.cornerRadius = 8
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
    
    
     
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
       db.collection("Favorites").addDocument(data: [
            "id" : detail?.id as Any,
            "title" : detail?.title as Any,
            "summary_text" : detail?.summary as Any,
            "image" : detail?.image as Any,
            "vegan" : detail?.vegan as Any,
            "serving_time" : detail?.servings as Any,
            "mail" : Auth.auth().currentUser?.email as Any]) { (error) in
                
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.buttonSave.titleLabel?.text = "DELETE"
                    self.buttonSave.titleLabel?.textAlignment = .center
                    self.buttonSave.backgroundColor = .red
                }
            }
    }
}
