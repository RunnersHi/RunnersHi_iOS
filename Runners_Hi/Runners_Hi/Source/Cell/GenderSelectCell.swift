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
    @IBOutlet weak var genderButton: UIButton!
    
    func set(_ genderbuttonName : Gender){
        genderButton.setTitle(genderbuttonName.genderbuttonName, for: .normal)
        self.genderButton.layer.cornerRadius = 8
        self.genderButton.backgroundColor = UIColor(red:101/255, green:101/255 ,blue:101/255, alpha:1.0)
        genderButton.setTitleColor(.white, for: .normal)
         genderButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:14)
    }
}
