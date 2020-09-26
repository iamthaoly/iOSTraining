//
//  CollectionCell.swift
//  Calculator
//
//  Created by doczy on 9/17/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var lblStudentName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateData(student: Student) {
        lblStudentId.text = student.id ?? "id"
        lblStudentName.text = student.name ?? "name"
    }
}
