//
//  CalculatorVC.swift
//  Calculator
//
//  Created by doczy on 9/15/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnDivide: UIButton!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnNumber0: UIButton!
    @IBOutlet weak var btnNumber9: UIButton!
    @IBOutlet weak var btnNumber8: UIButton!
    @IBOutlet weak var btnNumber7: UIButton!
    @IBOutlet weak var btnNumber6: UIButton!
    @IBOutlet weak var btnNumber5: UIButton!
    @IBOutlet weak var btnNumber4: UIButton!
    @IBOutlet weak var btnNumber3: UIButton!
    @IBOutlet weak var btnNumber2: UIButton!
    @IBOutlet weak var btnNumber1: UIButton!
    
    @IBOutlet weak var menuView: MenuView!
    
    var onCompletion:(() ->() )?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"
        lblResult.text = ""
        menuView.btnClicked = {[weak self] value in
            debugPrint("bien nhan duoc", value)
        }
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func clear() {
        lblResult.text = ""
        
    }
    @IBAction func divideAction() {
        addOperator(op: "/")
    }
    @IBAction func plusAction() {
        addOperator(op: "+")
    }
    @IBAction func minusAction() {
        addOperator(op: "-")
    }
    @IBAction func multiplyAction() {
        addOperator(op: "*")
    }
    @IBAction func addDot() {
        if (lblResult.text?.isEmpty == false && lblResult.text?.last != ".") {
            lblResult.text?.append(".")
        }
    }
    @IBAction func addNumber(btn: UIButton) {
        let number = String(btn.tag)
        lblResult.text?.append(number)
    }
    
    
    func addOperator(op: Character) {
        let all = "+-*/"
        var s = lblResult.text
        if lblResult.text?.isEmpty == false{
            var lastChar = s?.last
            // check if last char is number or operator
            if all.contains(lastChar ?? "m") {
                if lastChar != op {
                    lblResult.text?.removeLast()
                    lblResult.text?.append(op)
                }
            }
            else {
                lblResult.text?.append(op)
            }
            
        }
        
    }
    
    @IBAction func changeScreen() {
        let dataVC = DataVC(nibName: "DataVC", bundle: nil)
        dataVC.result = lblResult.text ?? "Null"
        navigationController?.pushViewController(dataVC, animated: true)
        
//        onCompletion?()
    }
    
    // Calculate button
    @IBAction func calcMain(){
        var s = lblResult.text
        var arr = Array(s!)
        // TODO: catch exception. Ex "5.=", "3+=",...
        do {
            try calculate(arr: &arr)
            s = String(arr)
            lblResult.text = s
        }
        catch {
            
        }
        
    }
    
    
    //LOGIC
    func getFirst(arr: [Character], mid: Int) -> Int{
        let op = "+-*/"
        var i: Int = mid - 1
        while(i > 0 && op.contains(arr[i]) == false) {
            i-=1
        }
        if i == 0 && arr[i] == "-" {
            return i
        }
        if op.contains(arr[i]) {
            i += 1
        }
        return i
        
    }
    func getLast(arr: [Character], mid: Int) -> Int {
        let op = "+-*/"
        var i: Int = mid + 1
        let len = arr.count
        while(i < (len - 1) && op.contains(arr[i]) == false) {
            i += 1
        }
        if op.contains(arr[i]) {
            i -= 1
        }
        return i
    }
    func cut(arr: [Character], start: Int, end: Int) -> Double {
        var strNum = ""
        for i in start...end {
            strNum.append(arr[i])
        }
        var res = (strNum as NSString).doubleValue
        return res
    }

     func calc(arr: inout[Character], index: Int) {
        let mid = index
        var start = getFirst(arr: arr, mid: mid)
        var end = getLast(arr: arr, mid: mid)

        var firstNum = cut(arr: arr, start: start, end: mid-1)
        var lastNum = cut(arr: arr, start: mid+1, end: end)
        //print(firstNum)
        //print(lastNum)

        var ans = 0.0
        switch arr[mid] {
        case "+": ans = firstNum + lastNum
        case "-": ans = firstNum - lastNum
        case "*": ans = firstNum * lastNum
        case "/": ans = firstNum / lastNum
        default: ans = 0
        }
        // round ans to 2 decimal places
        var strAns = floor(ans) == ans ? String(Int(ans)) : String(round(100*ans)/100)
        arr.removeSubrange(start...end)
        arr.insert(contentsOf: strAns, at: start)
    }


    func calculate(arr: inout[Character]) throws{
        while arr.contains("*") || arr.contains("/") {
            var mulIndex = arr.firstIndex(of: "*")
            var divIndex = arr.firstIndex(of: "/")
            mulIndex = mulIndex == nil ? Optional(Int.max) : mulIndex
            divIndex = divIndex == nil ? Optional(Int.max) : divIndex
            if mulIndex! < divIndex! {
                calc(arr: &arr, index: mulIndex!)
            }
            else {
                calc(arr: &arr, index: divIndex!)
            }
        }
        while arr.contains("+") || arr.contains("-") {
            let len = arr.count
            var plusIndex = arr.firstIndex(of: "+")
            var minusIndex = arr[1..<len].firstIndex(of: "-")
            if plusIndex == nil && minusIndex == nil {
                break
            }
            plusIndex = plusIndex == nil ? Optional(Int.max) : plusIndex
            minusIndex = minusIndex == nil ? Optional(Int.max) : minusIndex
            if plusIndex! < minusIndex! {
                calc(arr: &arr, index: plusIndex!)
            }
            else {
                calc(arr: &arr, index: minusIndex!)
            }
        }
    }

}
