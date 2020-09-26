//
//  HomeVC.swift
//  Calculator
//
//  Created by doczy on 9/16/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var btnCalculator: UIButton!
    @IBOutlet weak var btnTableView: UIButton!
    @IBOutlet weak var btnCollectionView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view.
    }
    @IBAction func openNewScreen(btn: UIButton) {
        //navigationController?.pushViewController(viewController: calculator, animated: true)
        var vc:UIViewController?
        var screenName:String = btn.titleLabel?.text ?? "label"
        switch screenName {
        case "Calculator":
            vc = CalculatorVC(nibName: "CalculatorVC", bundle: nil)
        case "TableView":
            vc = TableVC(nibName: "TableVC", bundle: nil)
        case "CollectionView":
            vc = CollectionVC(nibName: "CollectionVC", bundle: nil)
        case "DataPass":
            vc = DataPassVC(nibName: "DataPassVC", bundle: nil)
        default:
            vc = nil
        }
        debugPrint(screenName)
        if vc != nil {
            navigationController?.pushViewController(vc!, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
