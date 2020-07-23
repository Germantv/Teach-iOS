//
//  PokemonAPIManager.swift
//  Pokedex
//
//  Created by German Flores on 7/13/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import Foundation

class PokemonAPIManager {
    static let apiURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func fetchAllPokemon(completion: @escaping ([Pokemon]?, Error?) -> ()) {
        
        let url = URL(string: PokemonAPIManager.apiURL)!
        
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                let pokemonDictionaries = dataDictionary["results"] as! [ [String: Any] ]
                
                let pokemonArray = Pokemon.pokemonArray(dictionaries: pokemonDictionaries)
                
                completion(pokemonArray, nil)
                
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}


//    func fetchPokemon(pokemon: Pokemon, completion: @escaping (Pokemon?, Error?) -> ()) {
//        let url = URL(string: pokemon.url)!
//        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            // This will run when the network request returns
//            if let data = data {
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                let pokemonDictionary = dataDictionary
//
//                pokemon.id = pokemonDictionary["id"] as? Int
//
//                completion(pokemon, nil)
//            } else {
//                completion(nil, error)
//            }
//        }
//        task.resume()
//    }
