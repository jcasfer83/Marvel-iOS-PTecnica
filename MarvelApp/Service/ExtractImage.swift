//
//  ExtractImage.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 13/2/22.
//


// clase que tiene la funcionalidad de devolver la url customizada para que se puede hacer la petición de info a la API
//introduciendo el ide del personaje

import Foundation


struct ExtractImage {
    func extractImage (data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
}
