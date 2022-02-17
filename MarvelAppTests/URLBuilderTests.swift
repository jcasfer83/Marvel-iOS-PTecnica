//
//  URLBuilderTests.swift
//  MarvelAppTests
//
//  Created by Joaquin Castellano Fernandez on 17/2/22.
//

import XCTest
import CryptoKit
@testable import MarvelApp

class URLBuilderTests: XCTestCase {
    
    var url: URLBuilder!
    
    override func setUpWithError() throws {
        url = URLBuilder()
        
    }

    override func tearDownWithError() throws {
        url = nil
    }
    
    func testURL() {
        //Given: dado un valor x para variables que nos interesa testear
        let id = 0
        
        
        //When: invocamos la funcionalidad que queremos testear de la clase.
        
        let result = url.urlBuilder(int: id)
        
        //Then: comparamos el resultado con la solución esperada
        //La solución propuesta no es correcta
        XCTAssertEqual(result, "https://gateway.marvel.com:443/v1/public/characters?limit=25&ts=aoinviqeibvieauvbpe9rg9pv9ebv9pquebrvbqeruv")
    }

    

}
