//
//  LoserCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class LoserCell: UICollectionViewCell {
    static let identifier: String = "LoserCell"
    
    @IBOutlet weak var loserRankBack: UIImageView!
    @IBOutlet weak var loserRankRibbon: UIImageView!
    @IBOutlet weak var loserRankProfile: UIImageView!
    @IBOutlet weak var loserRankNum: UILabel!
    @IBOutlet weak var loserRankName: UILabel!
    @IBOutlet weak var loserRankScore: UILabel!
    
    override func awakeFromNib() {
        loserset()
    }
    
    func loserset(){
        loserRankBack.image = UIImage(named: "whiteboxRankfragment")
        loserRankRibbon.image = UIImage(named: "lankingbadge")
        loserRankNum.font = UIFont(name: "NotoSans-Medium", size:12.0)
        loserRankNum.textColor = .white
        loserRankName.font = UIFont(name: "NanumSquareB", size:15.0)
        loserRankScore.font = UIFont(name: "NanumSquareR", size:12.0)
    }
    
}
