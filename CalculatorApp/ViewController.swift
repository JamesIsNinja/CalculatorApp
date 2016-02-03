//
//  ViewController.swift
//  CalculatorApp
//
//  Created by student on 2016-02-03.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstNumber = Float32();
    var secondNumber = Float32();
    var typing = false;
    var result = 9999;
    var firstDec = false;
    var secondDec = false;
    var multiCalcs = false;
    var operation = "";
    
    @IBOutlet weak var CalcLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OneClicked(sender: AnyObject) {
        if typing == false {
            CalcLabel.text = ""
        }
        typing = true;
        let number = sender.currentTitle!!;
        CalcLabel.text = CalcLabel.text! + number;
    }

    @IBAction func equals(sender: AnyObject) {
        secondNumber = Float(CalcLabel.text!)!
        if  operation == "-" {
           let result = firstNumber - secondNumber
            CalcLabel.text = String(result)
        }
        else if operation == "+" {
            let result = firstNumber + secondNumber
            CalcLabel.text = String(result)
        }
        else if operation == "X" {
           let result = firstNumber * secondNumber
            CalcLabel.text = String(result)
        }
        else if operation == "/" {
            let result = firstNumber / secondNumber
            CalcLabel.text = String(result)
        }
    }
    
    @IBAction func operation(sender: AnyObject) {
        typing = false
        firstNumber = Float(CalcLabel.text!)!
        operation = sender.currentTitle!!;
        CalcLabel.text = operation;
        multiCalcs = true;
    }
    @IBAction func clear(sender: AnyObject) {
        firstNumber = 0;
        secondNumber = 0;
        typing = false;
        result = 9999;
        operation = "";
        CalcLabel.text = "0";
        multiCalcs = false;
    }
}

