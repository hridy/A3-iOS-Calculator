//
//  iOS 13 Calculator
//
//  Created by Hridyansh Sharma
//

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
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
        calculationPreview.text = ""
    }
    
    //Links to buttons 0 - 9
    //Only allows for max 8 digit input
    @IBAction func numberPad(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            display.text = runningNumber
            print("Number pressed: \(runningNumber)")
            calculationPreview.text! += "\(sender.tag)"
        }
    }
    
    // Adds decimal to input if it hasn't already been entered
    @IBAction func decimal(_ sender: RoundButton) {
        if runningNumber.count <= 7 && !runningNumber.contains("."){
            runningNumber += "."
            display.text = runningNumber
            calculationPreview.text! += "."
        }
    }
    
    // Resets calculator for new input
    @IBAction func allClear(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        display.text = "0"
        calculationPreview.text = ""
    }
    
    // Converts current value to positive or negative
    @IBAction func posOrNeg(_ sender: RoundButton) {
        print("pos / neg button pressed.")
        print("runningNumer: \(runningNumber)")
        print("leftValue: \(leftValue)")
        print("rightValue: \(rightValue)")
        
       if (runningNumber == ""){
            print("leftValue: \(leftValue)")
            let myDouble = (leftValue as NSString).doubleValue
            print("myDouble: \(myDouble)")
            leftValue = "\(myDouble * (-1))"
            print("leftValue after: \(leftValue)")
            display.text = leftValue
        }
            
        else{
            runningNumber = "\(Double(runningNumber)! * (-1))"
            display.text = runningNumber
            leftValue = "\(runningNumber)"
        }
        result = leftValue
    }
    
    @IBAction func percent(_ sender: RoundButton) {
        
        if (runningNumber == ""){
            let myDouble  = (result as NSString).doubleValue
            print("myDouble: \(myDouble)")
            leftValue = "\(myDouble * (0.01))"
            print("leftValue after: \(leftValue)")
            calculationPreview.text! += " ⁒ "
            display.text = leftValue
        }
            
        else{
            runningNumber = "\(Double(runningNumber)! * (0.01))"
            display.text = runningNumber
            calculationPreview.text! += " ⁒ "
            leftValue = "\(runningNumber)"
        }
    }
    
    @IBAction func divide(_ sender: RoundButton) {
        operation(operation: .Divide)
        calculationPreview.text! += " / "
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
        operation(operation: .Multiply)
        calculationPreview.text! += " x "
    }
    
    @IBAction func subtract(_ sender: RoundButton) {
        operation(operation: .Subtract)
        calculationPreview.text! += " - "
    }
    
    @IBAction func add(_ sender: RoundButton) {
        operation(operation: .Add)
        calculationPreview.text! += " + "
    }
    
    @IBAction func equal(_ sender: RoundButton) {
        operation(operation: currentOperation)
        calculationPreview.text! += " = "
    }
    
    func operation(operation: Operation){
        if currentOperation != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    print("\(leftValue) + \(rightValue) ")
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    calculationPreview.text = "\(leftValue) + \(rightValue) "
                }
                else if currentOperation == .Divide {
                    print("\(leftValue) / \(rightValue) ")
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                else if currentOperation == .Multiply {
                    print("\(leftValue) * \(rightValue) ")
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }
                else if currentOperation == .Subtract {
                    print("\(leftValue) - \(rightValue) ")
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }
                
                
                leftValue = result
                if (Double(leftValue)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(leftValue)!))"
                    display.text = result
                }
                else{
                    display.text = String(leftValue.prefix(9))
                }
                
                print("The result is \(result)")
            }
            currentOperation = operation
        }
        else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}


