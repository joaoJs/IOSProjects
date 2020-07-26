//
//  DetailViewController.swift
//  Album
//
//  Created by Joao Campos on 7/26/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var img: ImageCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageDetailsUI()
    }
    
    func setImageDetailsUI() {
        image.image = img?.img
        titleLabel.text = img?.titleLabel
        dateLabel.text = img?.titleLabel
        button = img?.viewBtn
    }

    @IBAction func pressedButton(_ sender: Any) {
    }
}
