//
//  GoalSelectCell.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/08.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class BattleGoalSelectCell: UICollectionViewCell {
    
    // MARK: Variable Part
    
    static let identifier: String = "BattleGoalSelectCell"
    
    // MARK: IBOutlet
    
    @IBOutlet weak var goalLabel: UILabel!
    
    override var isSelected: Bool {
        willSet {
            // willSet은 프로퍼티 옵저버로 값이 변경된 직후를 감지하는 역할을 한다.
            // Cell에서 isSelected는 Cell이 선택되었는지를 현지 true, false로 반환해주고 있는데 이 때 cell의 isSelected 값이 바뀌면 willSet이 감지를 해준다.
            // newValue는 이 안에서 사용할 수 있는 매개변수이다.
            
            goalLabel.backgroundColor = newValue ? UIColor.salmon : UIColor.unselectedbuttongray
            goalLabel.textColor = newValue ? UIColor.white : UIColor.black
            
            // 예시로 goalLabel.backgroundColor = newValue라는 변수를 지정을 해주는 것이고 newValue는 salmon과 unselectedbuttongray의 색을 왔다갔다 해준다( 현재 값이 salmon 이면 newValue에는 unselectedbuttongray가 할당이되고, 현재 값이 unselectedbuttongray면 newValue에는 salmon이 할당되는...! )
        }
        
    }
    
    // MARK: Life Cycle Part
    
    override func awakeFromNib() {
        setStyle()
    }
    
    // MARK: Function Default Style
    
    func setStyle() {
        goalLabel.textAlignment = .center
        goalLabel.backgroundColor = UIColor.unselectedbuttongray
        goalLabel.layer.cornerRadius = 8
        goalLabel.layer.masksToBounds = true
    }
    
    // MARK: Function Selected Style
    
    func setGoalInformation(_ goalInformation: GoalInformation) {
        
        goalLabel.setLabel(text: goalInformation.goal, color: .black, font: .nanumRegular(size: 16))
        
    }

}
