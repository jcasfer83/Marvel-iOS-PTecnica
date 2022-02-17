//
//  SearchData.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 11/2/22.
//

//esta clase se encarga de ejecutar la request a la API cuando es invocado su método fetchData()
import Foundation

class SearchData {
    
    let urlBuilder = URLBuilder()
    
    var id = 0
        
    func fetchData(completionHandler: @escaping ([Character]) -> Void) {
        
        let url = urlBuilder.urlBuilder(int: id)
        let task = URLSession.shared.dataTask(with: URL(string: url)! , completionHandler: { data, response, error in
        guard let data = data, error == nil else {
            print("Algo fue mal")
            return
        }

        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(APIResult.self, from: data)
            var characters: [Character] = []
            characters = result.data.results
            completionHandler(characters)
         
        } catch {
            print("error al convertir \(error.localizedDescription)")
        }
            
    })
        task.resume()
    }
    
}

