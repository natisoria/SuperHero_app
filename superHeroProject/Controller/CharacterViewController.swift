//
//  CharacterViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit
import Kingfisher

class CharacterViewController: UIViewController {
    @IBOutlet weak var characterImage : UIImageView!
    @IBOutlet weak var blackViewCharacter: UIView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var characterTableView: UITableView!
    
    var hero : Hero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterTableView.layer.cornerRadius = 30.0
        self.characterTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        
        nameCharacter.text = hero?.name
        characterImage.kf.setImage(with: URL(string: hero?.image?.url ?? ""), placeholder: DataProvider.shared.placeholderImage)
        
        characterTableView.delegate = self
        characterTableView.dataSource = self
        
        
        
    }
    
    
}

extension CharacterViewController: UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return nil
            case 1:
                return "Biography"
            case 2:
                return "Work"
            default:
                return "Connection"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.white
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
               return 160
            case 1:
               return 220
            case 2:
               return 120
            default:
                return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
            case 0:
           //  funcion cellPower declarada mas abajo
                return cellPower(tableView, indexPath)
                
            //  funcion cellBiography declarada mas abajo
            case 1:
                return cellBiography(tableView, indexPath)
                
            case 2:
                return cellWork (tableView, indexPath)
                
            default:
                return cellConnection(tableView, indexPath)
                
        }
    }
    
    private func cellPower(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableCell", for: indexPath) as? CharacterTableCell
//        poner una variable en la celda y en "charactertablecell" colocar la variable que declaré en la ccelda
        
        cell?.configure(intelligent: cast(power: hero?.powerstats?.intelligence),
                        strenght: cast(power: hero?.powerstats?.strength),
                        speed: cast(power: hero?.powerstats?.strength),
                        durability: cast(power: hero?.powerstats?.durability),
                        power: cast(power: hero?.powerstats?.durability),
                        combat: cast(power: hero?.powerstats?.combat))
        
        return cell ?? UITableViewCell()
    }
    
    private func cellBiography(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCharacterCell", for: indexPath) as? InformationCharacterCell
        
        cell?.configure(firstField: "FullName",
            secondField: "Place of Birth",
            thirdField: "First Appearance",
            fourthField: "Publisher",
            firstContent: hero?.biography?.fullName,
            secondContent: hero?.biography?.placeOfBirth,
            thirdContent: hero?.biography?.firstAppearance,
            fourthContent: hero?.biography?.publisher?.rawValue)
        
        return cell ?? UITableViewCell()
        
    }
    
    private func cellWork(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCharacterCell", for: indexPath) as? InformationCharacterCell
        
        cell?.configure(firstField: "Ocupation", secondField: "Base", firstContent: hero?.work?.occupation, secondContent: hero?.work?.base)
        
        return cell ?? UITableViewCell()
        
    }
    
    private func cellConnection(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCharacterCell", for: indexPath) as? InformationCharacterCell
        
        cell?.configure(firstField: "Group Afilation", secondField: "Relatives", firstContent: hero?.connections?.groupAffiliation, secondContent: hero?.connections?.relatives )
        
        return cell ?? UITableViewCell()
        
    }
}
