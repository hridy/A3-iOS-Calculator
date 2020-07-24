//
//  iOS 13 Calculator
//
//  Created by Hridyansh Sharma
//  Thursday July 23rd, 2020

import UIKit

enum Operation:String{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "NULL"
}


class ViewController: UIViewController {
    
    @IBOutlet weak var calculationPreview: UILabel!
    @IBOutlet weak var display: UILabel!
    
    // runningNumber keeps track of current equation
    // leftValue is number of left of an operation, rightValue vice versa
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var equalPressed = false
    var operationButtonPressed = false
    var currentOperation:Operation = .NULL
    
    /**
     Initializes the calculator screen on start.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
        calculationPreview.text = ""
    }
    
    /**
     Links to buttons 0 - 9 and only allows a max 8 digit input
     - Parameters:
     - sender: the button pressed
     */
    @IBAction func numberPad(_ sender: RoundButton) {
        print("equalPress: \(equalPressed)")
        if runningNumber.count <= 8 {
            
            equalPressed = false
            runningNumber += "\(sender.tag)"
            display.text = runningNumber
            print("Number pressed: \(runningNumber)")
            calculationPreview.text! += "\(sender.tag)"
        }
    }
    
    /**
     Adds a decimal to input if it hasn't already been entered
     - Parameters:
     - sender: the . button pressed
     */
    @IBAction func decimal(_ sender: RoundButton) {
        print ("Button Pressed: .")
        if runningNumber.count <= 7 && !runningNumber.contains("."){
            if runningNumber == "" {
                runningNumber += "0"
            }
            runningNumber += "."
            display.text = runningNumber
            calculationPreview.text! += "."
        }
    }
    
    /**
     Clears all running calculations and calculation preview
     - Parameters:
     - sender: the AC button pressed
     */
    @IBAction func allClear(_ sender: RoundButton) {
        print ("Button Pressed: AC")
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        display.text = "0"
        calculationPreview.text = ""
    }
    
    /**
     Converts input value to positive or negative
     - Parameters:
     - sender: the +/- button pressed
     */
    @IBAction func posOrNeg(_ sender: RoundButton) {
        print ("Button Pressed: +/-")
        print(runningNumber)
        print("leftValue: \(leftValue)")
        
        // runningNumber is zero in 2 cases
        // case 1: AC has been pressed, in which case all values are nil or zero
        // case 2: a calculation was performed before this
        if (runningNumber == "" && leftValue != ""){
            leftValue = "\(Double(leftValue)! * -1)"
            print("1. leftValue: \(leftValue)")
            checkInt(&leftValue)
            display.text = leftValue
        }
            
        else if leftValue == "" {
            runningNumber = "\(Double(runningNumber)! * (-1))"
            checkInt(&runningNumber)
            display.text = runningNumber
            leftValue = "\(runningNumber)"
        }
        
        result = leftValue
        calculationPreview.text = result
    }
    
    /**
     Linked to percent button. Converts input to a percentage
     - Parameters:
     - sender: the % button pressed
     */
    @IBAction func percent(_ sender: RoundButton) {
        print ("Button Pressed: %")
        
        if (runningNumber == ""){
            if leftValue == "" {
                leftValue = "0"
            }
            leftValue = "\(Double(leftValue)! * (0.01))"
            checkInt(&leftValue)
            print("leftValue after: \(leftValue)")
            display.text = leftValue
        }
            
        else{
            runningNumber = "\(Double(runningNumber)! * (0.01))"
            display.text = runningNumber
            leftValue = "\(runningNumber)"
        }
    }
    
    @IBAction func divide(_ sender: RoundButton) {
        print ("Button Pressed: ÷")
        operation(operation: .Divide)
        displaySymbol(symbol: " ÷ ")
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
        print ("Button Pressed: x")
        operation(operation: .Multiply)
        displaySymbol(symbol: " × ")
    }
    
    @IBAction func subtract(_ sender: RoundButton) {
        print ("Button Pressed: -")
        operation(operation: .Subtract)
        displaySymbol(symbol: " − ")
    }
    
    @IBAction func add(_ sender: RoundButton) {
        print ("Button Pressed: +")
        operation(operation: .Add)
        displaySymbol(symbol: " + ")
    }
    
    @IBAction func equal(_ sender: RoundButton) {
        print ("Button Pressed: =")
        equalPressed = true
        operation(operation: currentOperation)
    }
    
    /**
     Checks if the input in has any decimal values and if not, removes trailing zeros
     - Parameters:
     - stringNum: input string
     */
    func checkInt (_ stringNum: inout String){
        if (Double(stringNum)!.truncatingRemainder(dividingBy: 1) == 0){
            stringNum = "\(Int(Double(stringNum)!))"
        }
        else {
            stringNum = String(stringNum.prefix(9))
        }
    }
    
    /**
     Displays symbol in calculation preview. Checks to make sure it makes sense to display symbol.
     - Parameters:
     - symbol: math symbol to be added to the calculation preview
     */
    func displaySymbol (symbol:String){
        if leftValue.count > 0 && !equalPressed && !operationButtonPressed {
            calculationPreview.text! += symbol
            operationButtonPressed = true
        }
            
        else if equalPressed {
            print("displaySymbol: equalPressed")
            checkInt(&leftValue)
            calculationPreview.text = "\(leftValue) \(symbol)"
            equalPressed = true
        }
    }
    
    /**
     contains math operations to apply to current number based on button pressed
     - Parameters:
     - operation: all the possible math operations the calculator can do
     */
    func operation(operation: Operation){
        
        if currentOperation != .NULL{
            if runningNumber != ""{
                
                //runningNumber is reset for next input
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    if leftValue == ""{
                        leftValue = "0"
                    }
                    print("\(leftValue) + \(rightValue) ")
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    calculationPreview.text = "\(leftValue) + \(rightValue) ="
                }
                    
                else if currentOperation == .Divide {
                    if leftValue == ""{
                        leftValue = "0"
                    }
                    print("\(leftValue) / \(rightValue) ")
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                    calculationPreview.text = "\(leftValue) ÷ \(rightValue) ="
                }
                    
                else if currentOperation == .Multiply {
                    if leftValue == ""{
                        leftValue = "1"
                    }
                    print("\(leftValue) * \(rightValue) ")
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    calculationPreview.text = "\(leftValue) × \(rightValue) ="
                }
                    
                else if currentOperation == .Subtract {
                    if leftValue == ""{
                        leftValue = "0"
                    }
                    print("\(leftValue) - \(rightValue) ")
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    calculationPreview.text = "\(leftValue) - \(rightValue) = "
                }
                
                leftValue = result
                operationButtonPressed = false
                checkInt(&leftValue)
                display.text = leftValue
                print("The result is \(result)")
            }
            
            currentOperation = operation
        }
        else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            equalPressed = false
            operationButtonPressed = false
        }
    }
}


