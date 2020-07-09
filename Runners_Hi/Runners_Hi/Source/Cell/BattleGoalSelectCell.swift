//
//  GoalSelectCell.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class BattleGoalSelectCell: UICollectionViewCell {
    static let identifier: String = "BattleGoalSelectCell"
    
    @IBOutlet weak var goalLabel: UILabel!

    override var isSelected: Bool {
        willSet {
            goalLabel.backgroundColor = newValue ? UIColor.salmon : UIColor.unselectedbuttongray
            goalLabel.textColor = newValue ? UIColor.white : UIColor.black
        }
        

    }
    
    func setGoalInformation(_ goalInformation: GoalInformation){
        goalLabel.text = goalInformation.goal
    }
    override func awakeFromNib() {
        goalLabel.textAlignment = .center
        goalLabel.font = UIFont(name: "NanumSquare", size: 16)
        goalLabel.backgroundColor = UIColor.unselectedbuttongray
        //goalLabel.layer.borderWidth = 3
        goalLabel.layer.cornerRadius = 40
    }
}
