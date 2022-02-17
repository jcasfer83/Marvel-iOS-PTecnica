//
//  ViewController.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 11/2/22.
//

//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private let containerView: UIView = UIView()
  
    let link = SearchData()
    let image = ExtractImage()
    var charList: [Character] = []
    
    var index: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        link.fetchData {
            (chars) in
            for char in chars {
                self.charList.append(char)
            
            }
        }
  
        let queue1 = DispatchQueue(label: "queue1")
        queue1.sync {
                
            sleep(4) //muy sensible a la conexión y procesamiento de máquina virtual
            //los 4 segundos los he puesto por ensayo error
            //he intentado encontrar un método que al acabar la carga de patos permita pasarlos después a la
            //tableview y no tener que fijar un tiempo fijo.
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customcell")
            
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as? CustomTableViewCell
        cell?.myLabel.text = charList[indexPath.row].name
        cell?.myLabel2.text = "ID: \(charList[indexPath.row].id)"
        cell?.myImage.load(url: image.extractImage(data: charList[indexPath.row].thumbnail))
    
        return cell!
    }
}

extension ViewController: UITableViewDelegate  {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row //debe ir primero
        performSegue(withIdentifier: "VCCharacter", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let char = segue.destination as? CharacterViewController {
            char.nombre = charList[index].name
            char.descripcion = charList[index].description
            char.url = charList[index].thumbnail
            
            //index = 0
        }
    }
}
