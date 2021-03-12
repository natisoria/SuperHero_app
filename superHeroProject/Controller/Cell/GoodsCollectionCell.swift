//
//  GoodsCollectionCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 26/2/21.
//

import UIKit
import Kingfisher

class GoodsCollectionCell : UICollectionViewCell {
    @IBOutlet weak var goodsBackgroundView: UIView!
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var goodsBrand: UIImageView!
    @IBOutlet weak var goodsProgress: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // corner radius
        goodsBackgroundView.layer.cornerRadius = 8.0
        goodsBackgroundView.layer.masksToBounds = true
        
        goodsImage.layer.cornerRadius = 8.0
        goodsImage.layer.masksToBounds = true
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        goodsImage.image = nil
        goodsName.text = nil
        goodsBrand.image = nil
        goodsProgress.progress = 0

    }
    
    
    func configure(image: String?, name:String?, brand:String?, power: Float ){
        goodsImage.kf.setImage (with: URL(string: image ?? ""), placeholder: DataProvider.shared.placeholderImage)
        goodsName.text = name ?? ""
        goodsBrand.image = UIImage (named: brand ?? "")
        goodsProgress.progress = power
    }
    
}

