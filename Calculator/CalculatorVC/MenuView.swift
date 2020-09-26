//
//  MenuView.swift
//  Calculator
//
//  Created by doczy on 9/19/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    var btnClicked: ((String)->())?
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initCommon()
    }
    
    private func initCommon() {
        let view = loadNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
    }
    
    private func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MenuView", bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    @IBAction func btnClicked(btn: UIButton) {
        btnClicked?(String(btn.tag))
    }
}
