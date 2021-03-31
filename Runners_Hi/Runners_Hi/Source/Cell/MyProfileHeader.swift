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
    @IBOutlet weak var lvView: UIView!
    @IBOutlet weak var LvName: UILabel!
    @IBOutlet weak var LvLabel: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var ScoreName: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        headerset()
    }
    
    func headerset(){
        // Header에 들어가는 background 뷰 세팅
        myProfileBack.image = UIImage(named: "whiteboxRecdetailactivityMyrecord")
        lvView.backgroundColor = UIColor.unselectedbuttongray
        lvView.layer.cornerRadius = 8
        scoreView.backgroundColor = UIColor.unselectedbuttongray
        scoreView.layer.cornerRadius = 8
        
        // font extension 적용하여 기본 텍스트 세팅
        LvName.setLabel(text: "Lv.", color: .black, font: .nanumBold(size: 14.0))
        ScoreName.setLabel(text: "전적", color: .black, font: .nanumRegular(size: 14.0))
    }
    

    
    func myPageHeaderData(data: MyProfile?){
        // 전달받은 정보를 처리해주고, 값이 없는 경우에는 정해진 값을 넣어준다.
        let level = data?.result.level ?? 1
        let win = data?.result.win ?? 1
        let lose = data?.result.lose ?? 1
        let name:String = data?.result.nickname ?? "성북천치타"
        let myprofileImageFlag:Int = data?.result.image ?? 1
        
        // 데이터를 알맞게 넣어준다.
        dataSetting(level: level, win: win, lose: lose, name: name, imageFlag: myprofileImageFlag)
    }
    
    func dataSetting(level: Int, win: Int, lose: Int, name: String, imageFlag:Int ){
        
        let  myprofileImageList = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
        
        let levelList = ["초급","중급","고급"]

        
        myProfileImage.image = UIImage(named: myprofileImageList[imageFlag - 1])
        
        // font extension 적용
        LvLabel?.setLabel(text: "\(levelList[level-1])", color: .black, font: .nanumBold(size: 16.0))
        ScoreLabel?.setLabel(text: "\(win) 승 \(lose) 패", color: .black, font: .nanumBold(size: 16.0))
        myProfileName?.setLabel(text: name, color: .black, font: .nanumBold(size: 18.0))
        

    }
}
