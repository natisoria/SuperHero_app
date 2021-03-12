//
//  NeutralsCollectionCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit
import Kingfisher

class NeutralsCollectionCell: UICollectionViewCell {
    @IBOutlet weak var neutralsBackgroundView: UIView!
    @IBOutlet weak var neutralsImage: UIImageView!
    @IBOutlet weak var neutralsName: UILabel!
    @IBOutlet weak var neutralsBrand: UIImageView!
    @IBOutlet weak var neutralsProgress: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // corner radius
        neutralsBackgroundView.layer.cornerRadius = 8.0
        neutralsBackgroundView.layer.masksToBounds = true
        
        neutralsImage.layer.cornerRadius = 8.0
        neutralsImage.layer.masksToBounds = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        neutralsImage.image = nil
        neutralsName.text = nil
        neutralsBrand.image = nil
        neutralsProgress.progress = 0
    }
    
    func configure(image: String?, name: String, brand: String?, power: Float){
        neutralsImage.kf.setImage (with: URL(string: image ?? ""), placeholder: DataProvider.shared.placeholderImage)
        neutralsName.text = name
        neutralsBrand.image = UIImage (named: brand ?? "")
        neutralsProgress.progress = power
    }
    
    
    
    
}
