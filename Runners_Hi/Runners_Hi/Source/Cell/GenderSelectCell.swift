//
//  GenderSelectCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//


import UIKit

class GenderSelectCell: UICollectionViewCell {
    static let identifier : String = "GenderSelectCell"
    @IBOutlet weak var genderActionLabel: UILabel!
    
    
    func set(_ genderActionLabelName : Gender){
        genderActionLabel.text = genderActionLabelName.genderActionLabelName
        genderActionLabel.textColor = UIColor.white
        self.genderActionLabel.backgroundColor = UIColor.brownishGrey
        self.genderActionLabel.layer.cornerRadius = 8
        self.genderActionLabel.layer.masksToBounds = true
        genderActionLabel.font = UIFont(name:"NanumSquareB", size:14.0)
    }
    
    
    override var isSelected: Bool {
        willSet {
            self.genderActionLabel.backgroundColor = newValue ? UIColor.lightishBlue : UIColor.brownishGrey
            print(genderActionLabel.text ?? nil!)
//            if genderActionLabel.text == "남성" {
//                print("안녕하세요")
//                sendGender = 1
//                UserDefaults.standard.set(sendGender, forKey: "gender")
//            }
//            if genderActionLabel.text == "여성" {
//                print("영재바보")
//                sendGender = 2
//                UserDefaults.standard.set(sendGender, forKey: "gender")
//            }


//            let signStoryboard = UIStoryboard.init(name: "Sign", bundle: nil)
//
//            guard let SignUpVC = signStoryboard.instantiateViewController(identifier: "SignUpVC") as? SignUpVC else {
//                return
//            }
//            print("영재힘내구..",sendGender)
//            UserDefaults.standard.set(sendGender, forKey: "gender")
//            SignUpVC.cellGender = sendGender
            
        }
        
        
    }
    
}
