//
//  MainViewController.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 15/2/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "VCList", sender: self)
    }
    
    
    
}
