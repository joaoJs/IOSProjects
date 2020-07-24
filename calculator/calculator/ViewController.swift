//
//  ViewController.swift
//  calculator
//
//  Created by Joao Campos on 7/23/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var label: UILabel!
    
    var operation : String?
    var groups : [Double] = []
    var operations : [String] = []
    var cleanText : Bool = true
    
    func calculateTotal () -> Double {
        var accumulator : Double = groups.removeFirst()
        while (groups.count > 0 && operations.count > 0) {
            let currOp : String = self.operations.removeFirst()
            let group : Double = self.groups.removeFirst()
            let result : Double = makeOperation(accumulator,currOp,group)
            accumulator = result
        }
        return accumulator
    }
    
    func makeOperation (_ acc : Double,_ op : String,_ curr : Double) -> Double {
        switch op {
        case "division":
            return acc / curr
        case "multiplication":
            return acc * curr
        case "minus":
            return acc - curr
        case "plus":
            return acc + curr
        default:
            return acc
        }
    }
    
    @IBAction func ac(_ sender: Any) {
        self.label.text = "0"
        cleanText = true
        operation = nil
        groups = []
        operations = []
    }
    @IBAction func plusMinus(_ sender: Any) {
//        let text = self.label.text
//        DispatchQueue.main.async {
//            self.label.text = (text == "0") ? "Hello" : "0"
//        }
    }
    @IBAction func percentage(_ sender: Any) {
//        let text = self.label.text
//        DispatchQueue.main.async {
//            self.label.text = (text == "0") ? "Hello" : "0"
//        }
    }
    
    
    
    @IBAction func seven(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "7" : "\(text)7"
                self.cleanText = false
            }
        }
    }
    
    
    @IBAction func eight(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "8" : "\(text)8"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func nine(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "9" : "\(text)9"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func four(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "4" : "\(text)4"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func five(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "5" : "\(text)5"
                self.cleanText = false
            }
        }
    }
    
    
    @IBAction func six(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "6" : "\(text)6"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func one(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "1" : "\(text)1"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func two(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "2" : "\(text)2"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func three(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "3" : "\(text)3"
                self.cleanText = false
            }
        }
    }
    
    
    @IBAction func zero(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = self.cleanText == true ? "0" : "\(text)0"
                self.cleanText = false
            }
        }
    }
    
    @IBAction func dot(_ sender: Any) {
        DispatchQueue.main.async {
            if let text = self.label.text {
                self.label.text = "\(text) ."
                self.cleanText = false
            }
        }
    }
    
    
    @IBAction func division(_ sender: Any) {
        DispatchQueue.main.async {
            self.operation = "division"
            if let decimal = Double(self.label.text!) {
                self.operations.append("division")
                self.groups.append(decimal)
                self.label.text = "/"
                self.cleanText = true
            }
            
        }
    }
    
    @IBAction func multiplication(_ sender: Any) {
        DispatchQueue.main.async {
            self.operation = "multiplication"
            if let decimal = Double(self.label.text!) {
                self.operations.append("multiplication")
                self.groups.append(decimal)
                self.label.text = "X"
                self.cleanText = true
            }
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        DispatchQueue.main.async {
            self.operation = "minus"
            if let decimal = Double(self.label.text!) {
                self.operations.append("minus")
                self.groups.append(decimal)
                self.label.text = "-"
                self.cleanText = true
            }
        }
    }
    
    @IBAction func plus(_ sender: Any) {
        DispatchQueue.main.async {
            self.operation = "plus"
            if let decimal = Double(self.label.text!) {
                self.operations.append("plus")
                self.groups.append(decimal)
                self.label.text = "+"
                self.cleanText = true
            }
        }
    }
    
    @IBAction func equals(_ sender: Any) {
        DispatchQueue.main.async {
            if let decimal = Double(self.label.text!) {
                self.groups.append(decimal)
            }
            let total = self.calculateTotal()
            let text = String(total)
            self.label.text = text
        }
    }
    
}

