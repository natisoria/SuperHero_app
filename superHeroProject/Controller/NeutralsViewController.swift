//
//  NeutralsViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import UIKit

class NeutralsViewController : UIViewController{
    @IBOutlet weak var neutralsCollectionView: UICollectionView!
    @IBOutlet weak var neutralsFilter: UIBarButtonItem!
    
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(dcFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.neutralsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.neutralsFiltered, heroType: .dc)
            self?.neutralsCollectionView.reloadData()
        },
        marvelFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.neutralsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.neutralsFiltered, heroType: .marvel)
            self?.neutralsCollectionView.reloadData()
            
        },
        neutralsFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.neutralsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllNeutrals(list: DataProvider.shared.neutralsFiltered, heroType1: .dc, heroType2: .marvel)
            self?.neutralsCollectionView.reloadData()
        },
        allFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.neutralsFiltered
            self?.neutralsCollectionView.reloadData()
        })
    }
    

    
    private var heroesFiltered: [Hero] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        neutralsCollectionView.delegate = self
        neutralsCollectionView.dataSource = self
        

        heroesFiltered = DataProvider.shared.neutralsFiltered
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        es a donde voy a ir
        guard let destination = segue.destination as?
                CharacterViewController,
//              el que lo envia es un collectionViewCell
              let cell = sender as? UICollectionViewCell,
//              el indepath de el collection que se clickeo
              let indexPath = neutralsCollectionView.indexPath(for: cell) else {
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

extension NeutralsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroesFiltered.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 32,
               height: collectionView.frame.width / 2 - 32)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        1. crear la celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NeutralsCollectionCell", for: indexPath) as? NeutralsCollectionCell
        
        if (indexPath.row < heroesFiltered.count) {
        let data = DataProvider.shared.neutralsFiltered[indexPath.row]

        
            cell?.configure(image: data.image?.url,
                        name: data.name ?? "",
                        brand: data.biography?.logoPublisher,
                        power: cast(power: data.powerstats?.power))
        }
        
        return cell ?? UICollectionViewCell()
    }
}


