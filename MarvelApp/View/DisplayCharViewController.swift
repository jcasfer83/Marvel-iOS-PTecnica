//
//  DisplayCharViewController.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 14/2/22.
//

import UIKit

class DisplayCharViewController: UIViewController {

    @IBOutlet weak var myText: UITextView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var id:String = ""
    let link = SearchData()
    let image = ExtractImage()
    
    var charList: [Character] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charList = []
        if id != "" {
            link.id = Int(id)!
            link.fetchData {
                (chars) in
                for char in chars {
                    self.charList.append(char)
                
                }
            }
            let queue1 = DispatchQueue(label: "queue1")
            queue1.sync {
            
                sleep(1)
                self.myImage.load(url: image.extractImage(data: charList[0].thumbnail))
                self.myLabel.text = charList[0].name
                self.myText.text = charList[0].description
            }

        } else {
            self.myLabel.text = "Personaje no encontrado"
            self.myText.text = ""
        }
    }

}
