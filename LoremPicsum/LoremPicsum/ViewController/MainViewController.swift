import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    var tableView: UITableView?
    var images: [Image] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchImages{ result in
            switch result {
            case .success(let images):
                self.images = images
            case .failure(let error):
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
        tableView.backgroundColor = .white

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
        return self.images.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
       let imageURL = self.images[indexPath.row].downloadUrl
        NetworkManager.shared.fetchImage(imageURL: imageURL) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    cell.img?.image = image ?? UIImage(named: "graph")
                }
            case .failure(let error):
                print(error)
            }
        }

        cell.id?.text = self.images[indexPath.row].id

        return cell
    }

}
