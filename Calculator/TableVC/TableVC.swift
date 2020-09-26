//
//  TableVC.swift
//  Calculator
//
//  Created by doczy on 9/16/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

struct Student {
    var id: String?
    var name: String?
}

class TableVC: UIViewController {
    let tbvStudent = UITableView()
    var safeArea: UILayoutGuide!
    //let students = ["Link", "Zelda", "Midna", "Ganon"]
    let students = [
        Student(id: "K22", name: "Link"),
        Student(id: "K23", name: "Zelda"),
        Student(id: "K12", name: "Midna"),
        Student(id: "K20", name: "Ganon"),
    ]
    
    override func loadView() {
        super.loadView()
        self.title = "TableView"
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        tbvStudent.dataSource = self
        setUpTableView()
    }
    func setUpTableView() {
        //Add subview first before adding constraint
        view.addSubview(tbvStudent)
        
        tbvStudent.translatesAutoresizingMaskIntoConstraints = false
        tbvStudent.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tbvStudent.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tbvStudent.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tbvStudent.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tbvStudent.register(UINib(nibName: "MYCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
}

extension TableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //custom cell
        let cell = tbvStudent.dequeueReusableCell(withIdentifier: "cell") as! MYCell
        cell.updateData(student: students[indexPath.row])
    
//        let cell = tbvStudent.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = students[indexPath.row].id
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
}


