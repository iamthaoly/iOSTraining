//
//  MYCell.swift
//  Calculator
//
//  Created by doczy on 9/17/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class MYCell: UITableViewCell {

    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var lblStudentName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateData(student: Student) {
        lblStudentId.text = student.id ?? "id"
        lblStudentName.text = student.name ?? "name"
    }
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
}
