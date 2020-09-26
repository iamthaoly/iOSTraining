//
//  DataPassVC.swift
//  Calculator
//
//  Created by doczy on 9/19/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class DataPassVC: UIViewController {


    @IBOutlet weak var imgApp: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    var imageName:String = ""
    //@IBOutlet weak var closureMenuView: ClosureMenuView!
    @IBOutlet weak var closureMenuView: ClosureMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        closureMenuView.delegate = self
        
        closureMenuView.btnClicked = { [weak self] value in
            debugPrint("Button: ", value)
            self?.imageName = "img" + value
            self?.imgApp.image = UIImage(named: self?.imageName ?? "imgMessage")
        }
        
        // Do any additional setup after loading the view.
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
extension DataPassVC : ClosureMenuViewDelegate {
    func btnClickedDelegate(str: String) {
        debugPrint("Button: ", str)
        imageName = "img" + str
        imgApp.image = UIImage(named: imageName ?? "imgMessage")
    }
    
}
