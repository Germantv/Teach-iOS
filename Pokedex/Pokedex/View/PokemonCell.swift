//
//  PokemonCell.swift
//  Pokedex
//
//  Created by German Flores on 7/13/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
