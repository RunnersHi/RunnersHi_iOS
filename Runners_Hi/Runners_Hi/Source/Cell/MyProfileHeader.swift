//
//  MyProfileHeader.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/17.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MyProfileHeader: UICollectionReusableView {
    static let identifier: String = "MyProfileHeader"
//
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myProfileBack: UIImageView!
    @IBOutlet weak var myProfileName: UILabel!
    @IBOutlet weak var LvName: UILabel!
    @IBOutlet weak var LvLabel: UILabel!
    @IBOutlet weak var ScoreName: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    
        override func awakeFromNib() {
            headerset()
        }
        
        func headerset(){
//

            myProfileName.font = UIFont(name: "NanumSquareB", size:18.0)
            LvName.font = UIFont(name: "NanumSquareR", size:14.0)
            LvLabel.font = UIFont(name: "NanumSquareB", size:16.0)
            ScoreName.font = UIFont(name: "NanumSquareR", size:14.0)
            ScoreLabel.font = UIFont(name: "NanumSquareB", size:16.0)

            LvName.text = "Lv."
            ScoreName.text = "전적"
//
        }
    
    func sayhello(hello:String){
        print(hello)
    }
}
