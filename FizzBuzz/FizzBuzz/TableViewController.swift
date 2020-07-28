//
//  TableViewController.swift
//  FizzBuzz
//
//  Created by Joao Campos on 7/27/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! TableViewCell
        let n = indexPath.row + 1
        
        cell.num.text = "\(n)"
        
        return cell
    }
    
    

}
