//
//  Helpers.swift
//  LoremPicsum
//
//  Created by Joao Campos on 8/2/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class Helpers {
    
    static func getTypeColor(type: String) -> UIColor {
        switch type {
        case "normal":
        return UIColor(red: CGFloat(182.0/255.0), green: CGFloat(158.0/255.0) , blue: CGFloat(125.0/255.0) , alpha: 1.0)
        case "fire":
        return UIColor(red: CGFloat(182.0/255.0), green: CGFloat(85.0/255.0), blue: CGFloat(0.0/255.0), alpha: 1.0)
        case "fighting":
        return UIColor(red: CGFloat(186.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(0.0/255.0), alpha: 1.0)
        case "water":
        return UIColor(red: CGFloat(0.0/255.0), green: CGFloat(173.0/255.0), blue: CGFloat(163.0/255.0), alpha: 1.0)
        case "flying":
        return UIColor(red: CGFloat(159.0/255.0), green: CGFloat(129.0/255.0), blue: CGFloat(173.0/255.0), alpha: 1.0)
        case "grass":
        return UIColor(red: CGFloat(105.0/255.0), green: CGFloat(171.0/255.0), blue: CGFloat(0.0/255.0), alpha: 1.0)
        case "poison":
        return UIColor(red: CGFloat(126.0/255.0), green: CGFloat(53.0/255.0), blue: CGFloat(176.0/255.0), alpha: 1.0)
        case "electric":
        return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(200.0/255.0), blue: CGFloat(0.0/255.0), alpha: 1.0)
        case "ground":
        return UIColor(red: CGFloat(226.0/255.0), green: CGFloat(210.0/255.0), blue: CGFloat(110.0/255.0), alpha: 1.0)
        case "psychic":
        return UIColor(red: CGFloat(255.0/255.0), green: CGFloat(106.0/255.0), blue: CGFloat(146.0/255.0), alpha: 1.0)
        case "rock":
        return UIColor(red: CGFloat(178.0/255.0), green: CGFloat(160.0/255.0), blue: CGFloat(119.0/255.0), alpha: 1.0)
        case "ice":
        return UIColor(red: CGFloat(178.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: 1.0)
        case "bug":
        return UIColor(red: CGFloat(153.0/255.0), green: CGFloat(190.0/255.0), blue: CGFloat(101.0/255.0), alpha: 1.0)
        case "dragon":
        return UIColor(red: CGFloat(89.0/255.0), green: CGFloat(6.0/255.0), blue: CGFloat(197.0/255.0), alpha: 1.0)
        case "ghost":
        return UIColor(red: CGFloat(103.0/255.0), green: CGFloat(87.0/255.0), blue: CGFloat(130.0/255.0), alpha: 1.0)
        case "dark":
        return UIColor(red: CGFloat(91.0/255.0), green: CGFloat(71.0/255.0), blue: CGFloat(70.0/255.0), alpha: 1.0)
        case "steel":
        return UIColor(red: CGFloat(216.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(231.0/255.0), alpha: 1.0)
        case "fairy":
        return UIColor(red: CGFloat(237.0/255.0), green: CGFloat(185.0/255.0), blue: CGFloat(210.0/255.0), alpha: 1.0)
        case "???":
        return UIColor(red: CGFloat(74.0/255.0), green: CGFloat(106.0/255.0), blue: CGFloat(77.0/255.0), alpha: 1.0)
        case "":
        return UIColor(red: CGFloat(74.0/255.0), green: CGFloat(106.0/255.0), blue: CGFloat(77.0/255.0), alpha: 0.0)


        default:
        return UIColor(red: CGFloat(10.0/255.0), green: CGFloat(10.0/255.0), blue: CGFloat(10.0/255.0), alpha: 1.0)
        }
        
    }
    
}
