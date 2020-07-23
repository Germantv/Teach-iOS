//
//  GridViewController.swift
//  Pokedex
//
//  Created by German Flores on 7/23/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit
import AlamofireImage

class GridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    

    @IBOutlet weak var collectionView: UICollectionView!
    var pokemonArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        fetchPokemon()
    }
    
    
    // MARK: HELPER METHOD
    
    func fetchPokemon() {
        PokemonAPIManager().fetchAllPokemon { (pokemonArray: [Pokemon]?, error: Error?) in
            if let pokemonArray = pokemonArray {
                self.pokemonArray = pokemonArray
                
                for pokemon in pokemonArray {
                    print("\(pokemon.name), \(pokemon.url)\n")
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    
    // MARK: CollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonGridCell", for: indexPath) as! PokemonGridCell
        
        let pokemon = pokemonArray[indexPath.item]
        
        cell.nameLabel.text = pokemon.name
                
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png")!
        cell.spriteImageView.af.setImage(withURL: url)
        
        return cell
    }

}
