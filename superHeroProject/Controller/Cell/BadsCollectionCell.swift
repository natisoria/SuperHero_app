//
//  BadsCollectionCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit
import Kingfisher

class BadsCollectionCell : UICollectionViewCell {
    @IBOutlet weak var badsBackgroundView: UIView!
    @IBOutlet weak var badsImage: UIImageView!
    @IBOutlet weak var badsName: UILabel!
    @IBOutlet weak var badsBrand: UIImageView!
    @IBOutlet weak var badsProgress: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // corner radius
        badsBackgroundView.layer.cornerRadius = 8.0
        badsBackgroundView.layer.masksToBounds = true
        
        badsImage.layer.cornerRadius = 8.0
        badsImage.layer.masksToBounds = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        badsImage.image = nil
        badsName.text = nil
        badsBrand.image = nil
        badsProgress.progress = 0
        
        }
        
    func configure(image: String?, name: String, brand: String?, power: Float){
        badsImage.kf.setImage (with: URL(string: image ?? ""), placeholder: DataProvider.shared.placeholderImage)
        badsName.text = name
        badsBrand.image = UIImage (named: brand ?? "")
        badsProgress.progress = power
    }
    
    
}
