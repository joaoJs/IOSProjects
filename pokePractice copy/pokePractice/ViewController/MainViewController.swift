//
//  MainViewController.swift
//  pokePractice
//
//  Created by Joao Campos on 8/6/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tableView: UITableView?
    
    var pokes: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    var imagesDict: [String: UIImage] = [:]
    
    var defSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
    
    var offset: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callNetwork()
        
        self.setUp()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.reuseId)
        tableView.backgroundColor = UIColor(red: CGFloat(240.0/255.0), green: CGFloat(240.0/255.0), blue: CGFloat(250.0/255.0), alpha: 0.8)
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        self.tableView = tableView
        
    }
    
    func callNetwork() {
        
        if (self.offset < 150) {
            NetworkManager.shared.fetchPoke(offset: self.offset){ [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let pokes):
                    self.pokes.append(contentsOf: pokes.results)
                    self.offset = self.offset + 30
                case .failure(let error):
                    print("error fetchPoke")
                    print(error)
                }
            }
        }
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.reuseId, for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
        
        let name = self.pokes[indexPath.row].name
        
        if (self.imagesDict[name] != nil) {
            DispatchQueue.main.async {
                cell.textLabel?.text = name
                cell.imageView?.image = self.imagesDict[name]
            }
        } else {
            NetworkManager.shared.fetchForm(name: name) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let sprite):
                    let spriteUrl = sprite["front_default"]
                    NetworkManager.shared.fetchSprite(/*name: <#T##String#>,*/ spriteUrl: spriteUrl ?? self.defSprite) { [weak self] result in
                        guard let self = self else { return }
                        switch result {
                        case .success(let img):
                            DispatchQueue.main.async {
                                cell.textLabel?.text = name
                                self.imagesDict[name] = img
                                cell.imageView?.image = img
                            }
                        case .failure(let error):
                            print("error fetchImg")
                            print(error)
                        }
                    }
                case .failure(let error):
                    print("error fetchForm")
                    print(error)
                }
            }
        }
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastCellIndexPath = IndexPath(row: self.pokes.count - 1, section: 0)
        guard indexPaths.contains(lastCellIndexPath) else { return }
        self.callNetwork()
    }
    
}
