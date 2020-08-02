//
//  MainViewController.swift
//  PokeList
//
//  Created by Joao Campos on 8/1/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    var pokeTable: UITableView!
    
    var pokeList: [Pokemon] = []
    
    var currentPage: Int = 1
//    var images: [Int: UIImage?] = [:]
    var spritesList: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchPokemon{ result in
               switch result {
               case .success(let pokemonList):
                self.pokeList = pokemonList.results
               case .failure(let error):
                print("error")
                   //self.presentAlert(error: error)
               }
           }

        self.setUp()
    }
    
    private func setUp() {
        self.view.backgroundColor = .red
        print("setUP")
//        let poke = Pokemon(name: "dunsparce")
//        pokeList.append(poke)
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.delegate = self
        table.dataSource = self
        table.register(PokeTableViewCell.self, forCellReuseIdentifier: PokeTableViewCell.reuseId)
        
        self.view.addSubview(table)
        table.boundToSuperView()
        self.pokeTable = table
        
    }
    
//    func callNetworkForPokemon() {
//        NetworkManager.shared.fetchPokemon(/*page: self.currentPage*/){ [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let pokemonList):
//                print("Success")
//                let group = DispatchGroup()
//
//                pokemonList.forEach{ pokemon in
//                    group.enter()
//                    NetworkManager.shared.fetchOnePokemon(pokeName: pokemon.name ?? "kakuna") { [weak self] (result) in
//                        guard let self = self else { return }
//                        switch result{
//                        case .success(let sprites):
//                            print("joao")
//                            print(sprites)
//                            self.spritesList = sprites.data
//                        case .failure(_):
//                            self.spritesList = ["one":"error"]
//                        }
//                        group.leave()
//                    }
//                }
//                group.notify(queue: DispatchQueue.main) {
//                    self.pokeList.append(contentsOf: pokemonList)
//                    self.currentPage = self.currentPage + 1
//                }
//
//            case .failure(let error):
//                print("error")
//                print(error)
//                //self.presentAlert(error: error)
//            }
//        }
//    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokeTableViewCell.reuseId, for: indexPath) as? PokeTableViewCell else {
            return UITableViewCell()
        }
                
        print("Here")
        //let id = self.movies[indexPath.row].id
        //cell.pokemonSpriteView.image = self.images[id] ?? UIImage(named: "question-mark")
        cell.titleLabel.text = self.pokeList[indexPath.row].name
        cell.pokemonSpriteView.image = UIImage(named: "graph")
        
        return cell
    }
    
}

//extension MainViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//    }
//
//}

//extension MainViewController: UITableViewDataSourcePrefetching {
//
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        print("prefetch")
//        let lastCellIndexPath = IndexPath(row: self.pokeList.count - 1, section: 0)
//        guard indexPaths.contains(lastCellIndexPath) else { return }
//        self.callNetworkForPokemon()
//    }
//
//}
