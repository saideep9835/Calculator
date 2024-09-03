//
//  ViewController.swift
//  Calculator
//
//  Created by Saideep Reddy Talusani on 8/30/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var valueFromCalculator: UILabel!
    
    var performingMath: Bool = false
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        valueFromCalculator.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatorButton(_ sender: UIButton) {
        
        if performingMath == true {

        valueFromCalculator.text = String(sender.tag-1)

        numberOnScreen = Double(valueFromCalculator.text!)!

        performingMath = false

        }

        else {

            valueFromCalculator.text = valueFromCalculator.text! + String(sender.tag-1)

        numberOnScreen = Double(valueFromCalculator.text!)!

        }


    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if valueFromCalculator.text != "" && sender.tag != 11 && sender.tag != 16{

        previousNumber = Double(valueFromCalculator.text!)!

        if sender.tag == 12 { //Divide
            valueFromCalculator.text = "/";
        }
        if sender.tag == 13 { //Multiply
            valueFromCalculator.text = "x";
        }
        if sender.tag == 14 { //Subtract
            valueFromCalculator.text = "-";
        }
        if sender.tag == 15 { //Add
            valueFromCalculator.text = "+";
        }
        operation = sender.tag
        performingMath = true;
        }

        else if sender.tag == 16 {

        if operation == 12{ //Divide

            valueFromCalculator.text = String(previousNumber / numberOnScreen)

        }

        else if operation == 13{ //Multiply

            valueFromCalculator.text = String(previousNumber * numberOnScreen)
        }

        else if operation == 14{ //Subtract

            valueFromCalculator.text = String(previousNumber - numberOnScreen)

        }

        else if operation == 15{ //Add

            valueFromCalculator.text = String(previousNumber + numberOnScreen)

        }

        }

        else if sender.tag == 11{

            valueFromCalculator.text = ""

        previousNumber = 0;

        numberOnScreen = 0;

        operation = 0;

        }
    }
    override func didReceiveMemoryWarning() {

    super.didReceiveMemoryWarning()

    // Dispose of any resources that can be recreated.

    }
}

