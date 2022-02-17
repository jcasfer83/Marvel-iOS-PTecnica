//
//  CharacterViewController.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 13/2/22.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var nombre:String?
    var descripcion:String?
    var url:[String: String]?
    
    let image = ExtractImage()
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myText: UITextView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = nombre
        if descripcion == "" {
            myText.text = "Descripción no encontrada"
        } else {
            myText.text = descripcion
        }
        
        myImage.load(url: image.extractImage(data: url!))

        
    }
    

   

}
