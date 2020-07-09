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
        self.levelButton.layer.cornerRadius = 8
        self.levelButton.backgroundColor = UIColor(red:101/255, green:101/255 ,blue:101/255, alpha:1.0)
        levelButton.setTitleColor(.white, for: .normal)
        levelButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:14)
    }
}
