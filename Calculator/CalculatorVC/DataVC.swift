//
//  DataVC.swift
//  Calculator
//
//  Created by doczy on 9/19/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class DataVC: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    var result:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblResult.text = "This is the result"
        // Do any additional setup after loading the view.
        lblResult.text = result
        
        let destination = CalculatorVC(nibName: "CalculatorVC", bundle: nil)
//        vc.calculatorVC = self
        
        destination.onCompletion = { [weak self] () in
            // this will be executed when `backButtonTapped(_:)` will be called
            debugPrint("aklo")
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destination = segue.destination as? CalculatorVC else { return }
//        destination.onCompletion = { [weak self] () in
//            // this will be executed when `backButtonTapped(_:)` will be called
//            debugPrint("aklo")
//        }
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
