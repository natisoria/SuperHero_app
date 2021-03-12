//
//  CharacterTableCell.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit

class CharacterTableCell: UITableViewCell{
    @IBOutlet weak var intelligentText: UILabel!
    @IBOutlet weak var intellgentProgressBar: UIProgressView!
    @IBOutlet weak var strenghtText: UILabel!
    @IBOutlet weak var strenghtProgressBar: UIProgressView!
    @IBOutlet weak var speedText: UILabel!
    @IBOutlet weak var speedProgressBar: UIProgressView!
    @IBOutlet weak var durabilityText: UILabel!
    @IBOutlet weak var durabilityProgressBar: UIProgressView!
    @IBOutlet weak var powerText: UILabel!
    @IBOutlet weak var powerProgressBar: UIProgressView!
    @IBOutlet weak var combatText: UILabel!
    @IBOutlet weak var combatProgressBar: UIProgressView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        intelligentText.text = "Intelligent"
        strenghtText.text = "Strenght"
        speedText.text = "Speed"
        durabilityText.text = "Durability"
        powerText.text = "Power"
        combatText.text = "Combat"
       
//        falta poner los textos de las decripciones ¿Cómo hago?
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        intellgentProgressBar.progress = 0
        strenghtProgressBar.progress = 0
        speedProgressBar.progress = 0
        durabilityProgressBar.progress = 0
        powerProgressBar.progress = 0
        combatProgressBar.progress = 0
        
    }
    
//    Como se hace el configure del progress image?
    func configure( intelligent: Float, strenght: Float,speed: Float, durability: Float, power: Float, combat : Float ){
        intellgentProgressBar.progress = intelligent
        strenghtProgressBar.progress = strenght
        speedProgressBar.progress = speed
        durabilityProgressBar.progress = durability
        powerProgressBar.progress = power
        combatProgressBar.progress = combat
        
    }
    
    
}

