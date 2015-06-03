//
//  ViewController.swift
//  Calculator
//
//  Created by Sayan Das on 03/06/15.
//  Copyright (c) 2015 Sayan Das. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var typing: Bool = false
    var operandStack = Array<Double> ()
    
    @IBAction func numberPushed(sender: UIButton) {
        
        if !typing {
            typing = true
            display.text = sender.currentTitle!
        }
        else{
            display.text = display.text! + sender.currentTitle!
        }
    }

    @IBAction func enter() {
        typing = false
        operandStack.append(displayValue)
//        display.text = "0."
        println(operandStack)
    }
    
    var displayValue: Double {
        get{
           return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
    }
    
    @IBAction func operation(sender: UIButton) {
        if typing {
            enter()
        }
        switch sender.currentTitle! {
        case "+":
            performOperation({(op1: Double, op2: Double)-> Double in return op1 + op2})
        case "-":
            performOperation({(op1: Double, op2: Double)-> Double in return op2 - op1})
        case "x":
            performOperation({(op1: Double, op2: Double)-> Double in return op1 * op2})
        case "/":
            performOperation({(op1: Double, op2: Double)-> Double in return op2 / op1})
        default:
            break
        }
        
//         performOperation({(op1: Double, op2: Double)-> Double in return op1 + op2})
    }
    
    func performOperation(operate:(Double, Double)-> Double){
        if operandStack.count > 1{
            display.text = "\(operate(operandStack.removeLast(),operandStack.removeLast()))"
            enter()
        }
    }
}

