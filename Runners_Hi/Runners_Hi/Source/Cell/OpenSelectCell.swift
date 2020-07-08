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
    }
}
