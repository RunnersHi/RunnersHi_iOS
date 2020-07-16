//
//  MonthlyCell.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MonthlyCell: UICollectionViewCell {
    static let identifier: String = "MonthlyCell"
    
    @IBOutlet weak var monthlyRankBack: UIImageView!
    @IBOutlet weak var monthlyRankRibbon: UIImageView!
    @IBOutlet weak var monthlyRankProfile: UIImageView!
    @IBOutlet weak var monthlyRankNum: UILabel!
    @IBOutlet weak var monthlyRankName: UILabel!
    @IBOutlet weak var monthlyRankDistance: UILabel!
    
    override func awakeFromNib() {
        monthlyset()
    }
    
    func monthlyset(){
        monthlyRankBack.image = UIImage(named: "whiteboxRankfragment")
        monthlyRankRibbon.image = UIImage(named: "lankingbadge")
        monthlyRankNum.font = UIFont(name: "NotoSans-Medium", size:12.0)
        monthlyRankNum.textColor = .white
        monthlyRankName.font = UIFont(name: "NanumSquareB", size:15.0)
        monthlyRankDistance.font = UIFont(name: "NanumSquareR", size:12.0)
    }
    
}
