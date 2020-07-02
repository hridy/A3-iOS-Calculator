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
    
    @IBOutlet weak var display: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = "0"
    }
    
    @IBAction func numberPad(_ sender: RoundButton) {
        if runningNumber.count <= 8{
            runningNumber += "\(sender.tag)"
            display.text = runningNumber
            print("Number pressed: \(runningNumber)")
        }
    }
    
    @IBAction func decimal(_ sender: RoundButton) {
        if runningNumber.count <= 7 && !runningNumber.contains("."){
            runningNumber += "."
            display.text = runningNumber
        }
    }
    
    @IBAction func allClear(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        display.text = "0"
    }
    
    @IBAction func posOrNeg(_ sender: RoundButton) {
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
            display.text = leftValue
        }
            
        else{
            runningNumber = "\(Double(runningNumber)! * (0.01))"
            display.text = runningNumber
            leftValue = "\(runningNumber)"
        }
    }
    
    @IBAction func divide(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func multiply(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func subtract(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func add(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func equal(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    func operation(operation: Operation){
        if currentOperation != .NULL{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    print("\(leftValue) + \(rightValue) ")
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
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


