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

    @IBOutlet weak var levelActionLabel: UILabel!

    
  func set(_ levelActionLabelName : Level){
      levelActionLabel.text = levelActionLabelName.levelActionLabelName
      levelActionLabel.textColor = UIColor.white
      self.levelActionLabel.backgroundColor = UIColor.brownishGrey
      self.levelActionLabel.layer.cornerRadius = 8
      self.levelActionLabel.layer.masksToBounds = true
    levelActionLabel.font = UIFont(name:"NanumSquareB", size:14.0)
  }
  
  override var isSelected: Bool {
      willSet {
          self.levelActionLabel.backgroundColor = newValue ? UIColor.lightishBlue : UIColor.brownishGrey
          
      }
  }
}
