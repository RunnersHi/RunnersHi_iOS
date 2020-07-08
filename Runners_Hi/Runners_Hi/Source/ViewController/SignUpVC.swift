//
//  SignUpVC.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate {
    static let identifier: String = "SignUpVC"
    
    @IBOutlet weak var genderbuttonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGenderList()
        genderbuttonCollectionView.delegate = self
        genderbuttonCollectionView.dataSource = self
        self.genderbuttonCollectionView.isScrollEnabled = false
        

    }
    
    
    private var genderList : [Gender] = []
    
    func setGenderList(){
        let Gender1 = Gender(buttonName: "남성")
        let Gender2 = Gender(buttonName: "여성")
        
        genderList = [Gender1, Gender2]
    }
}



extension SignUpVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genderList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let GenderSelectCell = collectionView.dequeueReusableCell(withReuseIdentifier: GenderSelectCell.identifier, for: indexPath) as? GenderSelectCell else {return UICollectionViewCell() }
        GenderSelectCell.set(genderList[indexPath.row])
        return GenderSelectCell
    }
}


extension SignUpVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
//        let screenRect = UIScreen.main.bounds
//        let frameWidth = screenRect.size.width
//        let frameHeight = screenRect.size.height
        return CGSize(width: 152, height: 48)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
    
}
