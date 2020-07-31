//
//  TableViewCell.swift
//  Programmatic
//
//  Created by Joao Campos on 7/28/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//
import UIKit

class TableViewCell: UITableViewCell {

    static let reuseId: String = "MyCell"
    
    var numberLabel: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let numberLabel = UILabel(frame: .zero)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.textColor = .blue
        
        self.contentView.addSubview(numberLabel)
        
        numberLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
            
        self.numberLabel = numberLabel
    }
}
