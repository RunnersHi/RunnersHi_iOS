//
//  WinnerCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class WinnerCell: UICollectionViewCell {
    static let identifier: String = "WinnerCell"
    
    @IBOutlet weak var winnerRankBack: UIImageView!
    @IBOutlet weak var winnerRankRibbon: UIImageView!
    @IBOutlet weak var winnerRankProfile: UIImageView!
    @IBOutlet weak var winnerRankNum: UILabel!
    @IBOutlet weak var winnerRankName: UILabel!
    @IBOutlet weak var winnerRankScore: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        winnerset()
    }
    
    func winnerset(){
        
        winnerRankBack?.image = UIImage(named: "whiteboxRankfragment")
        winnerRankRibbon?.image = UIImage(named: "lankingbadge")
        winnerRankNum?.font = UIFont(name: "NotoSans-Medium", size:12.0)
        winnerRankNum?.textColor = .white
        winnerRankName?.font = UIFont(name: "NanumSquareB", size:15.0)
        winnerRankScore?.font = UIFont(name: "NanumSquareR", size:12.0)
    }
    
}
