//
//  BattleGenderSelectCell.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/09.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class BattleGenderSelectCell: UICollectionViewCell {
    static let identifier: String = "BattleGenderSelectCell"
    
    @IBOutlet weak var genderLabel: UILabel!
    
    override var isSelected: Bool {
        willSet {
            genderLabel.backgroundColor = newValue ? UIColor.salmon : UIColor.unselectedbuttongray
            genderLabel.textColor = newValue ? UIColor.white : UIColor.black
        }
    }
    
    func setGenderInformation(_ setGenderInformation: Gender){
        genderLabel.text = setGenderInformation.genderbuttonName
    }
    
    override func awakeFromNib() {
        genderLabel.textAlignment = .center
        genderLabel.font = UIFont(name: "NanumSquare", size: 16)
        genderLabel.backgroundColor = UIColor.unselectedbuttongray
        genderLabel.layer.cornerRadius = 40
        
    }
    
}
