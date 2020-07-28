//
//  CustomTableViewCell.swift
//  AlbumProgrammatic
//
//  Created by Joao Campos on 7/27/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let reuseId: String = "CustomTableViewCell"

    var img: UIImageView?
    var titleLabel: UILabel?
    var dateLabel: UILabel?
    
    var color = "black"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        let vStackView = UIStackView(frame: .zero)
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.distribution = .fillEqually
        vStackView.axis = .vertical

        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "graph")
        
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "title"
        titleLabel.textColor = color == "black" ? .black : .red
        
        let dateLabel = UILabel(frame: .zero)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = "date"
        dateLabel.textColor = .black
        
        vStackView.addArrangedSubview(titleLabel)
        vStackView.addArrangedSubview(dateLabel)
        
        self.contentView.addSubview(vStackView)
        self.contentView.addSubview(imageView)
        
        vStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        vStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 8).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.img = imageView
        self.titleLabel = titleLabel
        self.dateLabel = dateLabel
    }
    
}
