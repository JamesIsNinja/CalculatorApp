//
//  ViewController.swift
//  CalculatorApp
//
//  Created by student on 2016-02-03.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        CalcLabel.text = sender.currentTitle!!
    }

}

