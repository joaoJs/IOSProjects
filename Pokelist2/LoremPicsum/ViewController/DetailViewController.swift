//
//  DetailViewController.swift
//  LoremPicsum
//
//  Created by Joao Campos on 8/2/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageView: UIImageView?
    var name: UILabel?
    var typeOne: UILabel?
    var typeTwo: UILabel?
    var stackView: UIStackView?
    
    var tuple: (imageView: UIImage?, name: String, typeOne: String?, typeTwo: String?)?
    
    init(details: (imageView: UIImage?, name: String, typeOne: String?, typeTwo: String?)) {
        self.tuple = details
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp(to: self.tuple?.typeOne ?? "", tt: self.tuple?.typeTwo ?? "")
        self.name?.text = self.tuple?.name
        self.typeOne?.text = self.tuple?.typeOne
        self.typeTwo?.text = self.tuple?.typeTwo
        self.imageView?.image = self.tuple?.imageView
    }
    
    private func setUp(to: String, tt: String) {
            self.view.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1.0)
        
            //let view = UIView()
            let stackView = UIStackView(frame: .zero)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.alignment = .fill
            stackView.distribution = .fillProportionally
            stackView.spacing = 8.0
            stackView.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: 1.0)

            
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "Graph")
            
            let name = UILabel(frame: .zero)
            name.translatesAutoresizingMaskIntoConstraints = false
            name.text = "test"
            name.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(50.0/255.0), alpha: 0.8)
            name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 32.0)
            name.textAlignment = .center
            
            let typeOne = UILabel(frame: .zero)
            typeOne.translatesAutoresizingMaskIntoConstraints = false
        typeOne.textColor = Helpers.getTypeColor(type: to)
            typeOne.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)
            typeOne.textAlignment = .center
            
            let typeTwo = UILabel(frame: .zero)
            typeTwo.translatesAutoresizingMaskIntoConstraints = false
        typeTwo.textColor = Helpers.getTypeColor(type: tt)
            typeTwo.font = UIFont(name: "AvenirNextCondensed-Medium", size: 18.0)
            typeTwo.textAlignment = .center
            
        
            self.view.addSubview(imageView)
            self.view.addSubview(stackView)
            stackView.addArrangedSubview(name)
            stackView.addArrangedSubview(typeOne)
            stackView.addArrangedSubview(typeTwo)
            

        imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        //imageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        
            
        
           
            self.imageView = imageView
            self.name = name
            self.typeOne = typeOne
            self.typeTwo = typeTwo
            self.stackView = stackView
        }

}
