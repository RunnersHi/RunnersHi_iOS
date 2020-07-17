//
//  ProfileBadgeCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/17.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ProfileBadgeCell: UICollectionViewCell {
    static let identifier: String = "ProfileBadgeCell"
    
    @IBOutlet weak var myProfileBadge: UIImageView!
    @IBOutlet weak var myProfileName: UILabel!
    
    
    override func awakeFromNib() {
        profilebadgeset()
    }
    
    func profilebadgeset(){
         myProfileName.font = UIFont(name: "NanumSquareB", size:12.0)
    }
}
