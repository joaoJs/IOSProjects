//
//  ImageCell.swift
//  Album
//
//  Created by Joao Campos on 7/25/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class ImageCell {
    
    var img: UIImage
    var titleLabel: String
    var dateLabel: String
    var viewBtn: UIButton
    
    init(img: UIImage, title: String, date: String, btn: UIButton) {
        self.img = img
        self.titleLabel = title
        self.dateLabel = date
        self.viewBtn = btn
    }
    
}
