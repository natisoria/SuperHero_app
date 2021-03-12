//
//  GoodsViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 26/2/21.
//

import UIKit

class GoodsViewController : UIViewController {
    @IBOutlet weak var goodCollectionView: UICollectionView!
    @IBOutlet weak var goodsFilter: UIButton!
    
    @IBAction func filterPressed(_ sender: UIButton){
        filterActionSheet(dcFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.goodsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.goodsFiltered, heroType: .dc)
            self?.goodCollectionView.reloadData()
        },
        marvelFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.goodsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllHeroes(list: DataProvider.shared.goodsFiltered, heroType: .marvel)
            self?.goodCollectionView.reloadData()

        },
        neutralsFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.goodsFiltered
            self?.heroesFiltered = DataProvider.shared.filterAllNeutrals(list: DataProvider.shared.goodsFiltered, heroType1: .dc, heroType2: .marvel)
            self?.goodCollectionView.reloadData()
        },
        allFilter: { [weak self] _ in
            self?.heroesFiltered = DataProvider.shared.goodsFiltered
            self?.goodCollectionView.reloadData()
        })
    }
    
    private var heroesFiltered: [Hero] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Filter heroes
        heroesFiltered = DataProvider.shared.goodsFiltered
        
        goodCollectionView.delegate = self
        goodCollectionView.dataSource = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        es a donde voy a ir
        guard let destination = segue.destination as?
                CharacterViewController,
//              el que lo envia es un collectionViewCell
              let cell = sender as? UICollectionViewCell,
//              el indepath de el collection que se clickeo
              let indexPath = goodCollectionView.indexPath(for: cell) else {
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

extension GoodsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroesFiltered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 - 16,
               height: collectionView.frame.width / 2 - 16)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //  1. crear la celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodsCollectionCell", for: indexPath) as? GoodsCollectionCell
        // 2. creo la constante data donde se pasa la lista de heroes buenos, por cada row que tiene el indexPath
        
        if indexPath.row < heroesFiltered.count {
            let data = heroesFiltered[indexPath.row]
            // 3. creo el configure
            
            cell?.configure(image: data.image?.url,
                            name: data.name,
                            brand: data.biography?.logoPublisher,
                            power: cast(power: data.powerstats?.power))
        }
        
         
        return cell ?? UICollectionViewCell()
    }
    
    
}



