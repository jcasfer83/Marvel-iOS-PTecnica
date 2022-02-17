//
//  URLBuilder.swift
//  MarvelApp
//
//  Created by Joaquin Castellano Fernandez on 14/2/22.
//

//clase que permite construir la url que se va a utilizar en la request a la api
//permite distinguir entre una petición de listado o de detalle de personaje mediante id

import Foundation
import CryptoKit

class URLBuilder {
    
    func urlBuilder(int:Int) -> String {
        let publicKey = "4c5b85cb4e0139904a9739af0712a4a2"
        let privateKey = "98b4963d9ed0577b0a20529d6bc137dc687e5f02"

        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(privateKey)\(publicKey)")
        var url = ""
        
        if int == 0 {
            url = "https://gateway.marvel.com:443/v1/public/characters?limit=25&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        } else {
            url = "https://gateway.marvel.com:443/v1/public/characters/\(int)?&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
        }
        return url
    }
    
    private func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
        String(format: "%02hhx", $0)
            }
        .joined()
    }
}
