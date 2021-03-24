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
//            print(genderActionLabel.text ?? nil!)
            
        }
        
        
    }
    
}
