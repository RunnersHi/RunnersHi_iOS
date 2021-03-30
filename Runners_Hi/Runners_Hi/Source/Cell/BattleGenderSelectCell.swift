//
//  BattleGenderSelectCell.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/09.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class BattleGenderSelectCell: UICollectionViewCell {
    
    // MARK: Variable Part
    
    static let identifier: String = "BattleGenderSelectCell"
    
    // MARK: IBOutlet
    
    @IBOutlet weak var genderLabel: UILabel!
    
    override var isSelected: Bool {
        willSet {
            // willSet은 프로퍼티 옵저버로 값이 변경된 직후를 감지하는 역할을 한다.
            
            genderLabel.backgroundColor = newValue ? UIColor.salmon : UIColor.unselectedbuttongray
            genderLabel.textColor = newValue ? UIColor.white : UIColor.black
            
        }
    }
    
    func setGenderInformation(_ setGenderInformation: Gender) {
        
        genderLabel.setLabel(text: setGenderInformation.genderActionLabelName, color: .black, font: .nanumRegular(size: 16))
        
    }
    
    // MARK: Life Cycle Part
    
    override func awakeFromNib() {
        
        setStyle()
    }
    
    // MARK: Function Default Style
    
    func setStyle() {
        
        // 라벨 text 가운데 정렬
        genderLabel.textAlignment = .center
        genderLabel.backgroundColor = UIColor.unselectedbuttongray
        
        //Label 둥글게
        genderLabel.layer.cornerRadius = 8
        genderLabel.layer.masksToBounds = true
    }
    
}
