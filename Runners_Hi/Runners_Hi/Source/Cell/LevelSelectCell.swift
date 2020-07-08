//
//  LevelSelectCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//


import UIKit

class LevelSelectCell: UICollectionViewCell {
    static let identifier : String = "LevelSelectCell"
    @IBOutlet weak var levelButton: UIButton!
    
    func set(_ levelbuttonName : Level){
        levelButton.setTitle(levelbuttonName.levelbuttonName, for: .normal)
    }
}
