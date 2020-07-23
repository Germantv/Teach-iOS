//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by German Flores on 7/13/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit
import AlamofireImage

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var pokemonArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchPokemon()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let pokemon = pokemonArray[indexPath.row]
            
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.pokemon = pokemon
        }
    }
    
    // MARK: HELPER METHOD
    
    func fetchPokemon() {
        PokemonAPIManager().fetchAllPokemon { (pokemonArray: [Pokemon]?, error: Error?) in
            if let pokemonArray = pokemonArray {
                self.pokemonArray = pokemonArray
                
                for pokemon in pokemonArray {
                    print("\(pokemon.name), \(pokemon.url)\n")
                }
                self.tableView.reloadData()

            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as! PokemonCell

        let pokemon = pokemonArray[indexPath.row]

        cell.nameLabel.text = pokemon.name
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!
        cell.pokemonImage.af.setImage(withURL: url)

        return cell
    }

}
