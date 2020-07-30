import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {

    var pokemonType: PokemonType?
    var dragonsList: [String] = []
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pokemonType = NetworkManager.shared.getPokemonType()
        guard let pokemonType = self.pokemonType else { return }
        let dragons = pokemonType.dragonList
               dragons.forEach{
                   self.dragonsList.append($0.pokemon.name)
                   print($0.pokemon.name)
               }
//       print(dragonsList)
//       print("done")
        self.setUp()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DragonCellTableViewCell.self, forCellReuseIdentifier: DragonCellTableViewCell.reuseId)
        tableView.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
            
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dragonsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DragonCellTableViewCell.reuseId, for: indexPath) as? DragonCellTableViewCell else {
            return UITableViewCell()
        }
        
        cell.dragonName?.text = dragonsList[indexPath.row]
        
        return cell
    }

}
