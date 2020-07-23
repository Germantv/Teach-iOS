//
//  Pokemon.swift
//  Pokedex
//
//  Created by German Flores on 7/13/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import Foundation

class Pokemon {
    var name: String
    var url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as? String ?? "No Name"
        url = dictionary["url"] as! String
    }
    
    class func pokemonArray(dictionaries: [ [String: Any] ]) -> [Pokemon] {
        // empty array of type [Pokemon]
        var pokemonArray: [Pokemon] = []
        
        for dictionary in dictionaries {
            // create new instance of a pokemon object
            // using our constructor that takes in a dictionary
            let pokemon = Pokemon(dictionary: dictionary)
            
            
            pokemonArray.append(pokemon)
        }
        return pokemonArray
    }
}


