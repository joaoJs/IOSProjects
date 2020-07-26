//
//  ImagesTableViewController.swift
//  Album
//
//  Created by Joao Campos on 7/25/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class ImagesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var imagenames = ["graph","graph2","graph3","graph4","graph5","graph6"]
    let segueIdentifier = "MySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueIdentifier {
            let destination = segue.destination as! DetailViewController
            destination.img = sender as? ImageCell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! TableViewCell
        
        DispatchQueue.main.async {
            cell.populateCell(cellImage: self.prepareImg(row: indexPath.row))
        }
        
        return cell
    }
    
    func getDate(row: Int) -> String {
        return row >= 9 ? "07/\(row + 1)/2020" : "07/0\(row + 1)/2020"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: self.segueIdentifier, sender: self.prepareImg(row: indexPath.row))
        }
    }
    
    func prepareImg(row: Int) -> ImageCell {
        let image = UIImage(named: self.imagenames[row % 6])
        let title = "\(row)"
        let date = self.getDate(row: row)
        let button = UIButton()
        
        let img = ImageCell(img: image ?? UIImage(), title: title, date: date, btn: button)
        
        return img
    }
    
}
