//
//  DragonCellTableViewCell.swift
//  JSONDragon
//
//  Created by Joao Campos on 7/29/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class DragonCellTableViewCell: UITableViewCell {

    static let reuseId: String = "DragonCell"
    
    var dragonName: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let dragonName = UILabel(frame: .zero)
        dragonName.translatesAutoresizingMaskIntoConstraints = false
        dragonName.textColor = .orange
        dragonName.textAlignment = .center
        
        self.contentView.addSubview(dragonName)
        
        dragonName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        dragonName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        dragonName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        dragonName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
            
        self.dragonName = dragonName
    }

}
