//
//  DataProvider.swift
//  superHeroProject
//
//  Created by Natalia Soria on 10/3/21.
//

import UIKit

class DataProvider {
    //    MARK: - Singleton start -
    
    static var shared: DataProvider = {
        return DataProvider()
    }()
    
    //    se crea un init privado
    private init(){}
    
    //    MARK: - Singleton end -
    
    var heroes: [Hero] = []
    
    let keyRandom = "Char1"
    
    let placeholderImage = UIImage (named: "img-splash")
    
    /// Load hero data from "hero_data.json"
    func loadHero() {
        guard let pathURL = Bundle.main.url(forResource: "hero_data", withExtension: "json") else {
            print("Can not find `hero_data` resource")
            return
        }
        
        do {
            let data = try Data(contentsOf: pathURL)
            heroes = try JSONDecoder().decode([Hero].self, from: data)
        } catch {
            print("Can not find `hero_data` resource")
        }
    }
    
    
    
    //    Lists 'good'
    var goodsFiltered: [Hero] {
        heroes.filter { $0.biography?.alignment?.rawValue.contains("good") ?? false }
    }
    
    //    Lists 'bads'
    var badsFiltered: [Hero] {
        heroes.filter { $0.biography?.alignment?.rawValue.contains("bad") ?? false }
    }
    
    //    Lists 'neutrals'
    var neutralsFiltered: [Hero] {
        heroes.filter { $0.biography?.alignment?.rawValue.contains("neutral") ?? false }
    }
    
    func filterAllHeroes(list:[Hero], heroType: HeroType) -> [Hero]{
        list.filter {$0.biography?.publisher?.rawValue.contains(heroType.rawValue) ?? false}
    }
    
    func filterAllNeutrals(list:[Hero], heroType1: HeroType, heroType2: HeroType ) -> [Hero]  {
        list.filter{!($0.biography?.publisher?.rawValue.contains(heroType1.rawValue) ?? false || $0.biography?.publisher?.rawValue.contains(heroType2.rawValue) ?? false) }
    }
    

    private let heroMaxCount = 732
    var loadHeroObserver: ((_ progress: Float) -> ())? = nil
    var loadHeroCount = 0 {
        didSet {
            loadHeroObserver?(Float(loadHeroCount) / Float(heroMaxCount))
        }
    }
    
    func fetchHeroesId() {
        // Do any additional setup after loading the view.
        for id in 0...heroMaxCount {
            ApiService.shared.fetchHero(by: "\(id)") { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let hero = data as? Hero,
                              !(hero.id?.isEmpty ?? true) else {
                            return
                        }
                        self?.heroes.append(hero)
                        
                    case .failure(_):
                        break
                }
                
                self?.loadHeroCount += 1
            }
        }
    }
    
    func loadSelectedHero() -> Hero? {
        if let randomUserDefault = UserDefaults.standard.data(forKey: keyRandom){
            return try! JSONDecoder().decode(Hero.self, from: randomUserDefault)
        } else {
            return  nil
        }
         
    }
    
    
    func saveHero(hero: Hero){
        // A. guarda en el userdefault
        let characterData = try! JSONEncoder().encode(hero)
        UserDefaults.standard.setValue(characterData, forKey: keyRandom )
    }
    
   
} // cierre class





