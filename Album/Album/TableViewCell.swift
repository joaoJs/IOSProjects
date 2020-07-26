//
//  TableViewCell.swift
//  Album
//
//  Created by Joao Campos on 7/25/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    @IBOutlet weak var cellViewButton: UIButton!
    
    func populateCell(cellImage: ImageCell) {
        self.cellImage.image = cellImage.img
        self.cellTitle.text = cellImage.titleLabel
        self.cellDateLabel.text = cellImage.dateLabel
        self.cellViewButton = cellImage.viewBtn
    }
    
}
