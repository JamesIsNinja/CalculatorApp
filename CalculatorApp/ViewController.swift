//
//  ViewController.swift
//  CalculatorApp
//
//  Created by James White on 2016-02-03.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Variables to store the first and second numbers of the users equation
    var firstNumber = Float32();
    var secondNumber = Float32();
    //Boolean to check if the user is entering numbers still
    var typing = false;
    //Variable to store the end number of their calculation
    var result = 9999;
    //Boolean checks for only 1 decimal in each number
    var firstDec = false;
    var secondDec = false;
    //Boolean for if the user is doing a multi function calculation (ex 5x5x5x5+5-5/5+5)
    var multiCalcs = false;
    //Variable to store the operation the user is doing
    var operation = "";
    //A second boolean, and a counter for single decimals in multi function calculation
    var SingleDecimalPls = false
    var countingSingleDecialPls = 0;
    //Check boolean for handling crashes if the user trying to change the operator, or click the = sign without finishing their equation.
    var hitOperation = false;
    
    @IBOutlet weak var CalcLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Method for clicking on the numbers
    @IBAction func OneClicked(sender: AnyObject) {
        //If the user has not entered anything clear the 0 from the text field
        if typing == false {
            CalcLabel.text = ""
        }
        //No longer need to clear the 0
        typing = true;
        //Make the number = the number they clicked
        let number = sender.currentTitle!!;
        //Append any numbers after that in the label.
        CalcLabel.text = CalcLabel.text! + number;
        //Last thing the user hit was a # so hitOperation needs to be false.
        hitOperation = false;
    }
    //Method for the = button
    @IBAction func equals(sender: AnyObject) {
        //If the last key hit was not an operator
        if hitOperation == false {
            //Parse their second number
        secondNumber = Float(CalcLabel.text!)!
            //Check if they did -
        if  operation == "-" {
            //Calculate and display  result
           let result = firstNumber - secondNumber
            CalcLabel.text = String(result)
        }
            //Check if they did +
        else if operation == "+" {
            //calculate and display the result
            let result = firstNumber + secondNumber
            CalcLabel.text = String(result)
        }
            //Check if they did *
        else if operation == "X" {
            //Calculate and display the result
           let result = firstNumber * secondNumber
            CalcLabel.text = String(result)
        }
            //Check if they did division
        else if operation == "/" {
            //Calculate and display the result
            let result = firstNumber / secondNumber
            CalcLabel.text = String(result)
        }
            countingSingleDecialPls = 1;
        }
    }
    //This method gets the operation the user is going to do (+, -, /, *)
    @IBAction func operation(sender: AnyObject) {
        //If the last item they clicked was not an operator
        if hitOperation == false {
            //They are not typing numbers
        typing = false
            //Parse the first number out
         firstNumber = Float(CalcLabel.text!)!
                multiCalcs = true;
        }
            //Set hit operation to true, since the last thing they hit was an operator
        hitOperation = true;
    //For multiple calculations and decimals working together
    SingleDecimalPls = true;
    if SingleDecimalPls == true && countingSingleDecialPls > 1 {
    countingSingleDecialPls--;
        }
        //Make the calculator bar display the operator, and store the operation for calculating their answer
        operation = sender.currentTitle!!;
        CalcLabel.text = operation;
    
    }
    //Clear function resets all the variables so the user can start a new calculation
    @IBAction func clear(sender: AnyObject) {
        //Reset everything.
        firstNumber = 0;
        secondNumber = 0;
        typing = false;
        result = 9999;
        operation = "";
        CalcLabel.text = "0";
        multiCalcs = false;
        countingSingleDecialPls = 0;
        SingleDecimalPls = false;
        hitOperation = false;
    }
    //Function for the square root button, not working properly at the moment
    @IBAction func SquareRoot(sender: AnyObject) {
        //Parse the number
        firstNumber = Float(CalcLabel.text!)!
        var pls = Float32();
        //Sqrt the number
        pls = sqrtf(pls)
        
        //Display the answer
        CalcLabel.text = String(NSLog("%.f", sqrt(pls)))
    }
    //Function for adding a decimal to a number.
    @IBAction func addDecimal(sender: AnyObject) {
        //Check to make sure the user hasn't added a decimal to this number yet.
        if SingleDecimalPls == false && countingSingleDecialPls == 0 {
            //Add the decimal
        let number = sender.currentTitle!!;
        CalcLabel.text = CalcLabel.text! + number;
            countingSingleDecialPls++;
        }
            //Check if they've added a decimal to the second number
        else if SingleDecimalPls == true && countingSingleDecialPls == 1{
            // add the decimal.
            let number = sender.currentTitle!!;
            CalcLabel.text = CalcLabel.text! + number;
            countingSingleDecialPls++;
        }
    }
}

