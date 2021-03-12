//
//  AllCollectionCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 26/2/21.
//

import UIKit
import Kingfisher


class AllCollectionCell: UICollectionViewCell {
    @IBOutlet weak var allPhotoView: UIView!
    @IBOutlet weak var allPhoto: UIImageView!
    @IBOutlet weak var allTextView: UIView!
    @IBOutlet weak var allNameLabel: UILabel!
    @IBOutlet weak var allCategoryImage: UIImageView!
    
    
    
    override func awakeFromNib() {
         // corner radius
        allPhotoView.layer.cornerRadius = 8.0
        allPhotoView.layer.masksToBounds = true
        
        // shadow
        
        /*
        allPhotoView.layer.shadowColor = UIColor.black.cgColor
        allPhotoView.layer.shadowOpacity = 1
        allPhotoView.layer.shadowOffset = .zero
        allPhotoView.layer.shadowRadius = 20
 */
        
    }
    
    override func prepareForReuse() {
        
        allPhoto.image = nil
        allNameLabel.text = nil
        allCategoryImage.image = nil
        
    }
    
    
    func configure(photo: String?, name: String?, brand: String?){
        allPhoto.kf.setImage(with: URL(string: photo ?? ""), placeholder: DataProvider.shared.placeholderImage)
        allNameLabel.text = name ?? ""
        allCategoryImage.image = UIImage (named: brand ?? "")
        
        
    }
    
}

