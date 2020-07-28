//
//  AlbumListViewController.swift
//  AlbumProgrammatic
//
//  Created by Joao Campos on 7/27/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var images: [String] = ["graph","graph2","graph3","graph4","graph5","graph6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
    }
    
    private func setUp() {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseId)
        tableView.backgroundColor = .red
        
        
        self.view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
            

        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseId, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let img = prepareImg(row: indexPath.row)
        cell.img?.image = img
        cell.titleLabel?.text = "\(indexPath.row)"
        cell.dateLabel?.text = self.getDate(row: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let image = self.prepareImg(row: indexPath.row)
        let title = "\(indexPath.row): Details"
        let date = self.getDate(row: indexPath.row)
        
        let vc = DetailViewController(details: (image, title, date))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getDate(row: Int) -> String {
        return row >= 9 ? "07/\(row + 1)/2020" : "07/0\(row + 1)/2020"
    }
    
    private func prepareImg(row: Int) -> UIImage {
        return UIImage(named: self.images[row % 6]) ?? UIImage()
    }

}
