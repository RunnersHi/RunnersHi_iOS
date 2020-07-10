//
//  OpenSelectCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/09.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class OpenSelectCell: UICollectionViewCell {
    static let identifier : String = "OpenSelectCell"
    @IBOutlet weak var openActionLabel: UILabel!

    func set(_ openActionLabelName : Open){
        openActionLabel.text = openActionLabelName.openActionLabelName
        openActionLabel.textColor = UIColor.white
        self.openActionLabel.backgroundColor = UIColor.brownishGrey
        self.openActionLabel.layer.cornerRadius = 8
        self.openActionLabel.layer.masksToBounds = true
        openActionLabel.font = UIFont(name:"NanumSquareB", size:14.0)
    }
    
    override var isSelected: Bool {
        willSet {
            self.openActionLabel.backgroundColor = newValue ? UIColor.lightishBlue : UIColor.brownishGrey
            
        }
    }
}
