//
//  DetailViewController.swift
//  Pokedex
//
//  Created by German Flores on 7/14/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pokemon = pokemon {
            nameLabel.text = pokemon.name
        }
    }
    
    @IBAction func onTapLabel(_ sender: Any) {
        let title = nameLabel.text!
        let message = "Tapped the ui label with text: \(nameLabel.text!)"
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel)
        
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    @IBAction func onTapGreenButton(_ sender: Any) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toGreen" {
            // do something
            let greenVC = segue.destination as! GreenViewController
            let textToSend = textField.text
            greenVC.labelText = textToSend
            
        } else if segue.identifier == "toPurple" {
            // do something else
        }
    }
    

}
