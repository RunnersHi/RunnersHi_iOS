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
    
    func set(_ buttonName : Gender){
        genderButton.setTitle(buttonName.buttonName, for: .normal)
    }
}
