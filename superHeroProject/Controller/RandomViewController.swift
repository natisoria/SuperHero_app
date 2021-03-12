//
//  RandomViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit
import Kingfisher

class RandomViewController: UIViewController {
    @IBOutlet weak var firstScreenView : UIView!
    @IBOutlet weak var initialImage: UIImageView!
    @IBOutlet weak var normalView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var titleRandom: UILabel!
    @IBOutlet weak var randomButtom: UIButton!
    
    @IBOutlet weak var secondScreenView: UIView!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var secondBlackView: UIView!
    @IBOutlet weak var secondNormalView: UIView!
    @IBOutlet weak var titleCharacter: UILabel!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var intelligentLabel: UILabel!
    @IBOutlet weak var intelligentProgress: UIProgressView!
    @IBOutlet weak var strenghtLabel: UILabel!
    @IBOutlet weak var strenghtProgress: UIProgressView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedProgress: UIProgressView!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var durabilityProgress: UIProgressView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerProgress: UIProgressView!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var combatProgress: UIProgressView!
    @IBOutlet weak var againButton: UIButton!
    
    var heroRandom : Hero? = nil
    
    @IBAction func clickRandom() {
        // 1.- Obtener un Hero de la lista general de forma aleatoria
        heroRandom = DataProvider.shared.heroes.randomElement()
        
        // heroes[Int.random(in: 0...heroes.count - 1)]
        
        // 2.- Actualizar dato de secondScreenView con el Hero seleccionado
        configureViewHero(heroRandom)
        
        // 3.- Mostrar la segunda vista y ocultar la primera
        firstScreenView.isHidden = true
        secondScreenView.isHidden = false
        //    B. se llama a la función
        if let hero = heroRandom {
            DataProvider.shared.saveHero(hero: hero)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        firstScreenView.isHidden = false
        secondScreenView.isHidden = true
        
        configureViewTitles()
        gradientView()
        gradientSecondView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // C. obtenemos los datos
        let hero = DataProvider.shared.loadSelectedHero()
        
        // D. llamar a la función para que sea vea cuando vuelve a la pantalla
        configureViewHero(hero)
    }
    
    
    func gradientView(){
        blackView.backgroundColor = .black 
        let finalColor = UIColor.black
        let initialColor = finalColor.withAlphaComponent(0.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = [initialColor.cgColor,finalColor.cgColor]
        gradientLayer.locations = [0.9, 1]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    func gradientSecondView(){
        secondBlackView.backgroundColor = .black 
        let finalColor = UIColor.black
        let initialColor = finalColor.withAlphaComponent(0.0)
        let gradientLayer = CAGradientLayer()
        gradientLayer.type = .axial
        gradientLayer.colors = [initialColor.cgColor,finalColor.cgColor]
        gradientLayer.locations = [0.8, 1]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
  
//   traducciones
    private func configureViewTitles(){
        //        vista 1
        titleRandom.text = NSLocalizedString("titleView1", comment: "")
        randomButtom.setTitle(NSLocalizedString("buttomTitle", comment: ""), for:.normal)
        
        //        vista 2
        titleCharacter.text = NSLocalizedString("titleView2", comment: "")
        intelligentLabel.text = NSLocalizedString("intelligent", comment: "")
        strenghtLabel.text = NSLocalizedString("strenght", comment: "")
        speedLabel.text = NSLocalizedString("speed", comment: "")
        durabilityLabel.text = NSLocalizedString("durability", comment: "")
        powerLabel.text = NSLocalizedString("power", comment: "")
        combatLabel.text = NSLocalizedString("combat", comment: "")
        againButton.setTitle(NSLocalizedString("tryagain", comment: ""), for:.normal)
    }
    
    
    
    private func configureViewHero(_ hero: Hero?) {
        nameCharacter.text = hero?.name
        characterImage.kf.setImage(with: URL(string: hero?.image?.url ?? "") )
        intelligentProgress.progress = cast(power: hero?.powerstats?.intelligence)
        strenghtProgress.progress = cast(power: hero?.powerstats?.strength)
        speedProgress.progress = cast(power: hero?.powerstats?.speed)
        durabilityProgress.progress = cast(power: hero?.powerstats?.durability)
        powerProgress.progress = cast(power: hero?.powerstats?.power)
        combatProgress.progress = cast(power: hero?.powerstats?.combat)
    }
    

    
//    userDefault
   
    
} // cierre clase
