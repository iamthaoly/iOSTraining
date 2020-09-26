//
//  closureMenuView.swift
//  Calculator
//
//  Created by doczy on 9/19/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit
protocol ClosureMenuViewDelegate : NSObject {
    func btnClickedDelegate(str: String)
}
class ClosureMenuView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var btnClicked: ((String)->())?
    // Delegate
    weak var delegate: ClosureMenuViewDelegate!
    
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
        let nib = UINib(nibName: "ClosureMenuView", bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    @IBAction func btnClicked(btn: UIButton) {
        delegate.btnClickedDelegate(str: String(btn.titleLabel?.text ?? "Button title"))
        
//        btnClicked?(String(btn.titleLabel?.text ?? "Button title"))
    }

}
