//
//  MovieViewModel.swift
//  MoviesObjC
//
//  Created by iAskedYou2nd on 8/19/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

import UIKit

class PokemonViewModel: NSObject {
    
    var service: NetworkManager
    var pokes: [Pokemon] = []
    var offset: Int = 0
    var imagesDict: [String: String] = [:]
    
    var completion: (() -> ())?

    @objc
    init(service: NetworkManager = NetworkManager.sharedInstance()) {
        self.service = service
    }
    
    // ??
    @objc (bindWithCompletion:)
    func bind(completion: @escaping () -> ()) {
        self.completion = completion
    }

}

extension PokemonViewModel {
    
    @objc
    func fetchPokes() {
        
//        var pageNumber = 1
//        if let pResult = self.pageResult {
//            pageNumber = pResult.page
//        }
        
        
            self.service.fetchPokemon { (res: ResponseObj?) in
                        
                        guard let res = res, let results = res.results as? [Pokemon] else { return }
//                        self.pageResult = page
                        self.pokes.append(contentsOf: results)
                        self.completion?()
                    }
        
        
        
        
        
    }
    
    @objc
    func fetchSprites(index: Int, completion: @escaping (UIImage?) -> ()) {
        let name = self.pokes[index].name
        
        if (self.imagesDict[name] == nil) {
            print("getting images from network...")
            self.service.fetchForm(name) { (form: Form?) in

                guard let form = form else { return }
                guard let url = form.sprites["back_default"] as? String else {return}
//                self.pageResult = page
                self.imagesDict[name] = url
                //self.completion?()

            }
        }
        
        guard let imageUrl = self.imagesDict[name] else {return}
        
        self.service.fetchImage(imageUrl) { (image: UIImage?) in
            
            completion(image ?? UIImage(named: "graph"))
            
        }

    }
    
}

extension PokemonViewModel {
    
    @objc
    var count: Int {
        return self.pokes.count
    }
    
    @objc (titleWithIndex:)
    func name(index: Int) -> String {
        return self.pokes[index].name
    }
    
//    @objc (posterImageWithIndex:)
//    func posterImage(index: Int) -> String {
//        return self.movies[index].posterImage
//    }
    
}
