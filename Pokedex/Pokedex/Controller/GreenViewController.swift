//
//  GreenViewController.swift
//  Pokedex
//
//  Created by German Flores on 7/23/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    var labelText: String!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = labelText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
