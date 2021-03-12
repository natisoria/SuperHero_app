//
// AllViewController.swift
//  superHeroProject
//
//  Created by Natalia Soria on 23/2/21.
//

import UIKit


class AllViewController: UIViewController {
    @IBOutlet weak var allCollectionView: UICollectionView!
    @IBOutlet weak var allSearchCollectionView: UISearchBar!
    
    var searchData = DataProvider.shared.heroes.sorted {($0.name ?? "") < ($1.name ?? "")}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allCollectionView.delegate = self
        allCollectionView.dataSource = self
        
        allSearchCollectionView.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               // es a donde voy a ir
        guard let destination = segue.destination as?
                CharacterViewController,
              // el que lo envia es un collectionViewCell
              let cell = sender as? UICollectionViewCell,
              // el indepath de el collection que se clickeo
              let indexPath = allCollectionView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < searchData.count ){
            // el heroeselect = al heroe de la celde que clicke
            let heroSelected = searchData[indexPath.row]
            // variable creada en destino se convierte en heroSelected
            destination.hero = heroSelected
        }
    }
}
    
//    MARK: - Search bar -


extension AllViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3 - 8,
               height: collectionView.frame.width / 3 - 8)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //  1. crear la celda
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllCollectionCell", for: indexPath) as? AllCollectionCell
        
        if (indexPath.row < searchData.count) {
            // 2. creo la constante data donde se pasa la lista de heroes, por cada row que tiene el indexPath
            let data = searchData[indexPath.row]
            // 3. creo el configure
            cell?.configure(photo: data.image?.url,
                            name: data.name,
                            brand: data.biography?.logoPublisher)
        }
                
        return cell ?? UICollectionViewCell()
    }
    
//   función seach bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        searchData = []
        
        if searchText == "" {
            searchData = DataProvider.shared.heroes
        }
        else{
            for character in DataProvider.shared.heroes {
                if ((character.name?.lowercased().contains(searchText.lowercased())) ?? false) {
                    searchData.append(character)
                }
            }
        }
     
        self.allCollectionView.reloadData()
    }

}

