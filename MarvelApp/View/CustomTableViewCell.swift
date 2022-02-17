//
//  CustomTableViewCell.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 13/2/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
