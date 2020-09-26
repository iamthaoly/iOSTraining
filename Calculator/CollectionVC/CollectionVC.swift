//
//  CollectionVC.swift
//  Calculator
//
//  Created by doczy on 9/17/20.
//  Copyright © 2020 doczy. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController {
    //fileprivate -> can be read anywhere in the same file in was declared
    @IBOutlet weak var cvStudent: UICollectionView!
    //let cvStudent = UICollectionView()
    var safeArea: UILayoutGuide!
    let students = [
           Student(id: "K22", name: "Link"),
           Student(id: "K23", name: "Zelda"),
           Student(id: "K12", name: "Midna"),
           Student(id: "K20", name: "Ganon"),
       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CollectionView"
        
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        cvStudent.dataSource = self
        //Collection needs both dataSource and delegate. Table only needs dataSource
        cvStudent.delegate = self
        setUpCollectionView()
    }
    func setUpCollectionView() {
        //Add subview first before adding constraint
        view.addSubview(cvStudent)
         
        cvStudent.translatesAutoresizingMaskIntoConstraints = false
        cvStudent.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        cvStudent.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        cvStudent.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        cvStudent.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        cvStudent.register(UINib(nibName: "CollectionCell", bundle: nil), forCellWithReuseIdentifier: "cell")
         
        
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
extension CollectionVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    //number of cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return students.count
    }
    
    //cell data and design
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cvStudent.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        cell.updateData(student: students[indexPath.row])
        cell.backgroundColor = .blue
        return cell
    }
    
    //cell weight and height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double(UIScreen.main.bounds.width/4) - 2
        let height = Double(UIScreen.main.bounds.height/6)
        let size = CGSize(width: width, height: height)
        return size
    }
    
    //space between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
        
    }
    
}
