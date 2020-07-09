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
    @IBOutlet weak var openButton: UIButton!
    
    func set(_ openbuttonName : Open){
        openButton.setTitle(openbuttonName.openbuttonName, for : .normal)
        self.openButton.layer.cornerRadius = 8
        self.openButton.backgroundColor = UIColor(red:101/255, green:101/255 ,blue:101/255, alpha:1.0)
        openButton.setTitleColor(.white, for: .normal)
        openButton.titleLabel?.font = UIFont(name: "NanumSquareB", size:14)
        
    }
    
}
