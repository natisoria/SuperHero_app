//
//  ApiService.swift
//  superHeroProject
//
//  Created by Natalia Soria on 10/3/21.
//



import Foundation
import Alamofire

//1. baseURL= base común para hacer la petición
let apiToken = "10158853783164827"
let baseURL = {
    String.init(format: "https://superheroapi.com/api/%@",
                arguments: [apiToken])
    
}()

let apiCharacterIDUrl = "/%@"
let apiPowerstastUrl = "/%@/powerstats"
let apiBiographytUrl = "/%@/biography"
let apiAppearancetUrl = "/%@/appearance"
let apiWorkUrl = "/%@/work"
let apiConnectionUrl = "/%@/connections"
let apiImageUrl = "/%@/image"
let apiSearchUrl = "/search/%@"

enum ServiceResult {
    case success(data: Any?)
    case failure(error: String?)
    
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()


class ApiService {
    //    MARK: - Singleton -
    static let shared = {ApiService()
    }()
    
    private init() {}
    
    //    MARK: - Services - hacemos la peticion al servicio -
    
    //  2- se hace la función
    func fetchHero(by id: String, completion: @escaping ServiceCompletion) {
        let urlCharacterId = String.init(format: apiCharacterIDUrl,
                                         arguments: [id])
        
        // 2- se hace la petición por query(direccion internet),
        // 3- el método es (lo dice la web)
        AF.request("\(baseURL)\(urlCharacterId)",
                   method: .get,
                   encoding: URLEncoding.default).responseDecodable { (response: DataResponse<Hero, AFError>) in
                    if let error = response.error {
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        completion(.success(data: response.value))
                    }
                   }
    }
    
} // cierre class
