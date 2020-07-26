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
    
    var imageCellArray: [ImageCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.imageCellArray = populateArray()

    }
    
    func populateArray() -> [ImageCell] {
        var tempArray: [ImageCell] = []
        
        let imgCell1 = ImageCell(img: UIImage(named: "graph") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        let imgCell2 = ImageCell(img: UIImage(named: "graph2") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        let imgCell3 = ImageCell(img: UIImage(named: "graph3") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        let imgCell4 = ImageCell(img: UIImage(named: "graph4") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        let imgCell5 = ImageCell(img: UIImage(named: "graph5") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        let imgCell6 = ImageCell(img: UIImage(named: "graph6") ?? UIImage(), titleLabel: "Graph", dateLabel: "07/01/2020", viewBtn: UIButton())
        
        tempArray.append(imgCell1)
        tempArray.append(imgCell2)
        tempArray.append(imgCell3)
        tempArray.append(imgCell4)
        tempArray.append(imgCell5)
        tempArray.append(imgCell6)
        
        return tempArray
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let img = imageCellArray[indexPath.row % 6]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! TableViewCell
        cell.populateCell(cellImage: img, cellTitle: "\(indexPath.row)", cellDateLabel: getDate(row: indexPath.row), cellViewButton: UIButton())
        
        return cell
    }
    
    func getDate(row: Int) -> String {
        return row >= 9 ? "07/\(row + 1)/2020" : "07/0\(row + 1)/2020"
    }
    
}
