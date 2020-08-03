import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    var tableView: UITableView?
    var pokes: [Pokemon] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    var pokash: [String: PokeInfoCached] = [:]
    
    var defSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchPoke{ result in
            switch result {
            case .success(let pokes):
                self.pokes = pokes.results
            case .failure(let error):
                print("error fetchPoke")
                print(error)
            }
        }
        
        self.setUp()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        tableView.backgroundColor = UIColor(red: CGFloat(240.0/255.0), green: CGFloat(240.0/255.0), blue: CGFloat(250.0/255.0), alpha: 0.8)
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        self.tableView = tableView
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let name = self.pokes[indexPath.row].name
        
        
        // check is there is cached value
        if (self.pokash[name] != nil) {
            guard let types = pokash[name]?.types else { return UITableViewCell() }
            DispatchQueue.main.async {
                if types.count > 1 {
                    cell.typeOne?.text = types[0].type.name
                    cell.typeOne?.textColor = Helpers.getTypeColor(type: types[0].type.name)
                    cell.typeTwo?.text = types[1].type.name
                    cell.typeTwo?.textColor = Helpers.getTypeColor(type: types[1].type.name)
                    
                } else {
                    cell.typeOne?.text = types[0].type.name
                    cell.typeOne?.textColor = Helpers.getTypeColor(type: types[0].type.name)
                    cell.typeTwo?.text = ""
                    
                }
                
                cell.img?.image = self.pokash[name]?.sprite ?? UIImage(named: "graph")
                // abilities and moves are also cached
            }
            
        } else { // if value not in cache, get it and add it to cache
            
            NetworkManager.shared.fetchInfo(name: name) { result in
                switch result {
                case .success(let info):
                    print(name)
                    let types = info.types
                    let pokashData = PokeInfoCached(pokeInfo: info)
                    self.pokash[name] = pokashData
                    if types.count > 1 {
                        DispatchQueue.main.async {
                            cell.typeOne?.text = types[0].type.name
                            cell.typeOne?.textColor = Helpers.getTypeColor(type: types[0].type.name)
                            cell.typeTwo?.text = types[1].type.name
                            cell.typeTwo?.textColor = Helpers.getTypeColor(type: types[1].type.name)
                        }
                    } else {
                        DispatchQueue.main.async {
                            cell.typeOne?.text = types[0].type.name
                            cell.typeOne?.textColor = Helpers.getTypeColor(type: types[0].type.name)
                            cell.typeTwo?.text = ""
                        }
                    }
                case .failure(let error):
                    print("error fetch Info")
                    print(error)
                }
            }
            NetworkManager.shared.fetchForm(name: name) { result in
                switch result {
                case .success(let sprites):
                    let url = sprites["front_default"]
                    //self.pokash[name]?.spriteUrl = url
                    NetworkManager.shared.fetchSprite(spriteUrl: url ?? self.defSprite) { result in
                        switch result {
                        case .success(let image):
                            DispatchQueue.main.async {
                                self.pokash[name]?.sprite = image
                                cell.img?.image = image ?? UIImage(named: "graph")
                            }
                        case .failure(let error):
                            print("error fetch sprite")
                            print(error)
                        }
                    }
                case .failure(let error):
                    print("error fetch info")
                    print(error)
                }
            }
        }
        
        cell.name?.text = name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let name = pokes[indexPath.row].name
        
        DispatchQueue.main.async {
            let rowImg: UIImage? = self.pokash[name]?.sprite
            let types = self.pokash[name]?.types
            let typeOne: String?
            let typeTwo: String?
            
            if types?.count ?? [Type]().count > 1 {
                typeOne = types?[0].type.name
                typeTwo = types?[1].type.name
                
            } else {
                typeOne = types?[0].type.name
                typeTwo = ""
                
            }
            
            let vc = DetailViewController(details: (imageView: rowImg, name: name, typeOne: typeOne, typeTwo: typeTwo))
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
    }
    
}
