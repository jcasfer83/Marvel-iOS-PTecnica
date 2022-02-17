//
//  IdAskViewController.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 14/2/22.
//

import UIKit

class IdAskViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func myButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "VCid", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VCid" {
            if let id = segue.destination as? DisplayCharViewController {
                
                let idInteger = Int(myText.text)
                
                if idInteger != nil && idInteger! >= 1000000 && idInteger! <= 1100000 {
                    
                    id.id = myText.text
                } else {
                    
                    id.id = ""
                }
            }
        }
    }

}
