//
//  DetailViewController.swift
//  AlbumProgrammatic
//
//  Created by Joao Campos on 7/27/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageView: UIImageView?
    var titleLabel: UILabel?
    var dateLabel: UILabel?
    
    var tuple: (image: UIImage?, title: String, date: String)?
    
    init(details: (image: UIImage?, title: String, date: String)) {
        self.tuple = details
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.titleLabel?.text = self.tuple?.title
        self.dateLabel?.text = self.tuple?.date
        self.imageView?.image = self.tuple?.image
    }
    
    private func setUp() {
            self.view.backgroundColor = .white
            self.navigationItem.title = "Image Detail"
            
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "Graph")
            imageView.contentMode = .scaleAspectFit
            
            let titleLabel = UILabel(frame: .zero)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.text = "test"
            titleLabel.textColor = .black
            
            let date = UILabel(frame: .zero)
            date.translatesAutoresizingMaskIntoConstraints = false
            date.text = "Date"
            date.textColor = .black
            
            self.view.addSubview(imageView)
            self.view.addSubview(titleLabel)
            self.view.addSubview(date)

            imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
            imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
            imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        
        
            imageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true

            date.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
            date.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 32).isActive = true
            date.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -32).isActive = true
        
           
            self.imageView = imageView
            self.titleLabel = titleLabel
            self.dateLabel = date
        }

}
