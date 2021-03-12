//
//  InformationCharacterCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit

class InformationCharacterCell: UITableViewCell {
    @IBOutlet weak var titleCategory: UILabel!
    @IBOutlet weak var firstField : UILabel!
    @IBOutlet weak var secondField: UILabel!
    @IBOutlet weak var thirdField: UILabel!
    @IBOutlet weak var fourthField: UILabel!
    @IBOutlet weak var firstContent: UILabel!
    @IBOutlet weak var secondContent: UILabel!
    @IBOutlet weak var thirdContent: UILabel!
    @IBOutlet weak var fourthContent: UILabel!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleCategory.text = nil
        firstField.text = nil
        secondField.text = nil
        thirdField.text = nil
        fourthField.text = nil
        firstContent.text = nil
        secondContent.text = nil
        thirdContent.text = nil
        fourthContent.text = nil
        
    }
    
    
    func configure(category: String = "", firstField: String?, secondField: String?, thirdField: String? = "", fourthField: String? = "", firstContent: String?, secondContent: String?, thirdContent: String? = "", fourthContent: String? = ""){
        
        titleCategory.text = category
        self.firstField.text = firstField
        self.secondField.text = secondField
        self.thirdField.text = thirdField
        self.fourthField.text = fourthField
        self.firstContent.text = firstContent
        self.secondContent.text = secondContent
        self.thirdContent.text = thirdContent
        self.fourthContent.text = fourthContent
    }
    
    
    
    
}
