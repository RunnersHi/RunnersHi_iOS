//
//  BadgeCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {
    static let identifier: String = "BadgeCell"
    
    
    @IBOutlet weak var getBadge: UIImageView!
    @IBOutlet weak var getBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        badgeset()
    }
    
    func badgeset(){
        getBadgeLabel.font = UIFont(name: "NanumSquareB", size:12.0)
        
    }
}
