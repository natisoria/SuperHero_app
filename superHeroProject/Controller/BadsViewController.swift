//
//  BadsViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit

class BadsViewController : UIViewController {
    @IBOutlet weak var badsCollectionView: UICollectionView!
    @IBOutlet weak var badsFilter: UIBarButtonItem!
    
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(dcFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.badsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.badsFiltered, heroType: .dc)
            self?.badsCollectionView.reloadData()
        },
        marvelFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.badsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.badsFiltered, heroType: .marvel)
            self?.badsCollectionView.reloadData()
            
        },
        neutralsFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.badsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllNeutrals(list: DataProvider.shared.badsFiltered, heroType1: .dc, heroType2: .marvel)
            self?.badsCollectionView.reloadData()
        },
        allFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.badsFiltered
            self?.badsCollectionView.reloadData()
        })
    }
    
    
    private var heroesFiltered: [Hero] = []
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//  lista de todos los malos (hecho el filtro en una varible privada)
        heroesFiltered = DataProvider.shared.badsFiltered
        
        badsCollectionView.delegate = self
        badsCollectionView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        es a donde voy a ir
        guard let destination = segue.destination as?
                CharacterViewController,
              //   el que lo envia es un collectionViewCell
              let cell = sender as? UICollectionViewCell,
              // el indepath de el collection que se clickeo
              let indexPath = badsCollectionView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < heroesFiltered.count ){
            //  el heroeselect = al heroe de la celde que clicke
            let heroSelected = heroesFiltered[indexPath.row]
            //   variable creada en destino se convierte en heroSelected
            destination.hero = heroSelected
        }
    }
    
}

extension BadsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroesFiltered.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 16,
               height: collectionView.frame.width / 2 - 16)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //  1. crear la celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BadsCollectionCell", for: indexPath) as? BadsCollectionCell
        //  2. creo la constante data para pasarle el indexpath
        if (indexPath.row < heroesFiltered.count) {
            let data = heroesFiltered[indexPath.row]
            //  3. creo el configure para unirlo con la clase
            

            
            cell?.configure(image: data.image?.url,
                            name: data.name ?? "",
                            brand: data.biography?.logoPublisher,
                            power: cast(power: data.powerstats?.power))
        }
        
        return cell ?? UICollectionViewCell()
        
    }
}



