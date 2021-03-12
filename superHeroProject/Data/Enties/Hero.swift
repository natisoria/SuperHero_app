//
//  Hero.swift
//  superHeroProject
//
//  Created by Natalia Soria on 1/3/21.
//

import Foundation

enum HeroType: String, Codable {
    case dc = "DC Comics"
    case marvel = "Marvel Comics"
    case others = ""
}

enum HeroAlignment: String, Codable {
    case good = "good"
    case bad = "bad"
    case neutral = "neutral"
}
/*
// MARK: - HeroElement
class Hero: Codable {
    let id: Int?
    let name, slug: String?
    let powerstats: Powerstats?
    let appearance: Appearance?
    let biography: Biography?
    let work: Work?
    let connections: Connections?
    let images: Images?

    init(id: Int?, name: String?, slug: String?, powerstats: Powerstats?, appearance: Appearance?, biography: Biography?, work: Work?, connections: Connections?, images: Images?) {
        self.id = id
        self.name = name
        self.slug = slug
        self.powerstats = powerstats
        self.appearance = appearance
        self.biography = biography
        self.work = work
        self.connections = connections
        self.images = images
    }
}

// MARK: - Appearance
class Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?

    init(gender: String?, race: String?, height: [String]?, weight: [String]?, eyeColor: String?, hairColor: String?) {
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

// MARK: - Biography
class Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]?
    let placeOfBirth, firstAppearance: String?
    let publisher: HeroType?
    let alignment: HeroAlignment?
    
    var logoPublisher: String {
        switch publisher {
            case .marvel:
                return "ic_marvel"
            case .dc:
                return "ic_dc"
            default:
                return "ic_other"
        }
    }
    
    init(fullName: String?, alterEgos: String?, aliases: [String]?, placeOfBirth: String?, firstAppearance: String?, publisher: HeroType?, alignment: HeroAlignment?, imagePublisher: String?) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
    }
}

// MARK: - Connections
class Connections: Codable {
    let groupAffiliation, relatives: String?

    init(groupAffiliation: String?, relatives: String?) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}

// MARK: - Images
class Images: Codable {
    let xs, sm, md, lg: String?

    init(xs: String?, sm: String?, md: String?, lg: String?) {
        self.xs = xs
        self.sm = sm
        self.md = md
        self.lg = lg
    }
}

// MARK: - Powerstats
class Powerstats: Codable {
    let intelligence, strength, speed, durability: Int?
    let power, combat: Int?

    init(intelligence: Int?, strength: Int?, speed: Int?, durability: Int?, power: Int?, combat: Int?) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
}

// MARK: - Work
class Work: Codable {
    let occupation, base: String?

    init(occupation: String?, base: String?) {
        self.occupation = occupation
        self.base = base
    }
}
// clase vieja */

class Hero: Codable, CustomStringConvertible {
    var id, name: String?
    var powerstats: Powerstats?
    var biography: Biography?
    var appearance: Appearance?
    var work: Work?
    var connections: Connections?
    var image: Image?
    
    var description: String {
        "\(String(describing: id)) \(String(describing: name))"
    }

    init(id: String?, name: String?, powerstats: Powerstats?, biography: Biography?, appearance: Appearance?, work: Work?, connections: Connections?, image: Image?) {
        self.id = id
        self.name = name
        self.powerstats = powerstats
        self.biography = biography
        self.appearance = appearance
        self.work = work
        self.connections = connections
        self.image = image
    }
}

// MARK: - Appearance
class Appearance: Codable {
    var gender, race: String?
    var height, weight: [String]?
    var eyeColor, hairColor: String?

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }

    init(gender: String?, race: String?, height: [String]?, weight: [String]?, eyeColor: String?, hairColor: String?) {
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

// MARK: - Biography
class Biography: Codable {
    var fullName, alterEgos: String?
    var aliases: [String]?
    var placeOfBirth, firstAppearance:  String?
    var publisher: HeroType?
    var alignment: HeroAlignment?
    
    var logoPublisher: String {
        switch publisher {
            case .marvel:
                return "ic_marvel"
            case .dc:
                return "ic_dc"
            default:
                return "ic_other"
        }
    }

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }
    

    init(fullName: String?, alterEgos: String?, aliases: [String]?, placeOfBirth: String?, firstAppearance: String?, publisher: HeroType?, alignment: HeroAlignment?) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
    }
}

// MARK: - Connections
class Connections: Codable {
    var groupAffiliation, relatives: String?

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }

    init(groupAffiliation: String?, relatives: String?) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}

// MARK: - Image
class Image: Codable {
    var url: String?

    init(url: String?) {
        self.url = url
    }
}

// MARK: - Powerstats
class Powerstats: Codable {
    var intelligence, strength, speed, durability: String?
    var power, combat: String?

    init(intelligence: String?, strength: String?, speed: String?, durability: String?, power: String?, combat: String?) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
}

// MARK: - Work
class Work: Codable {
    var occupation, base: String?

    init(occupation: String?, base: String?) {
        self.occupation = occupation
        self.base = base
    }
}
