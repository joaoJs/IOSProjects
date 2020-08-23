//
//  MusicAlbumsTests.swift
//  MusicAlbumsTests
//
//  Created by Joao Campos on 8/23/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import XCTest
@testable import MusicAlbums

class NetworkMock: NetworkManager {
    let res = ResponseObj()
    let form = Form()

    @objc
    override func fetchPokemon(_ completion: @escaping (ResponseObj) -> Void) {
        //let res = ResponseObj()
        res.results = []
        let poke1 = Pokemon()
        poke1.name = "bulbasaur"
        poke1.url = "url"
        res.results.append(poke1)
        completion(res)
    }
    
    @objc
    override func fetchForm(_ pokeName: String, completion: @escaping (Form) -> Void) {
        form.sprites = ["back_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"]
        completion(form)
    }
}

class MusicAlbumsTests: XCTestCase {
    var vm: PokemonViewModel!
    var networkMock = NetworkMock()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = PokemonViewModel(service: networkMock)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
        super.tearDown()
    }

    
    func testPokeCount() throws {
        XCTAssertEqual(vm.count, 0, "initializes with 0")
    }
    
    func testImagesDict() throws {
        XCTAssertEqual(vm.imagesDict.count, 0, "initializes with 0")
    }
    
    func testNameShouldReturnNilBeforeNetworkCall() throws {
        XCTAssertEqual(vm.name(index:1), "No pokemons yet", "initializes with 0")
    }
    
    func testMockNetwork() throws {
        vm.fetchPokes()
        XCTAssertEqual(vm.count, 1, "Should have 1 pokemon after using mock service")
    }
    
    func testPokemonShouldHaveAName() throws {
        vm.fetchPokes()
        XCTAssertEqual(vm.name(index:0), "bulbasaur", "Should have pokemon named bulbasaur after calling mock network")
    }
    
    func testPokemonShouldHaveAImageUrl() throws {
        vm.fetchPokes()
        vm.fetchSprites(index:0) { image in
            
        }
        XCTAssertEqual(vm.imagesDict.count, 1, "Should have one image in images dict after calling fetchSprites")
        XCTAssertEqual(vm.imagesDict["bulbasaur"],"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png", "Should have correct url in the images dict")
    }
    

}
