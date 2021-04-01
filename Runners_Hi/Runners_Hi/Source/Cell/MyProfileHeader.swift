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
        // 헤더에 사용되는 데이터 값들과, 뷰를 세팅해주는 headerset()을 호출해준다.
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

        // 처리된 데이터를 바탕으로 데이터를 세팅하는 datasetting() 함수를 호출해준다.
        dataSetting(level: level, win: win, lose: lose, name: name, imageFlag: myprofileImageFlag)
    }
    
    func dataSetting(level: Int, win: Int, lose: Int, name: String, imageFlag:Int ){
        // 프로필 이미지와 레벨 리스트를 선언한다.
        // 해당 리스트의 원소들은 사용자의 프로필에 맞는 값을 표시하는데 사용된다.
        let  myprofileImageList = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
        let levelList = ["초급","중급","고급"]


        // 라벨의 값들을 입력해주고, 색, 폰트, 크기 세팅을 해준다.
        // font extension 적용
        LvLabel?.setLabel(text: "\(levelList[level-1])", color: .black, font: .nanumBold(size: 16.0))
        ScoreLabel?.setLabel(text: "\(win) 승 \(lose) 패", color: .black, font: .nanumBold(size: 16.0))
        myProfileName?.setLabel(text: name, color: .black, font: .nanumBold(size: 18.0))

        // 프로필 이미지 값에 맞게 프로필 이미지를 설정해준다.
        myProfileImage.image = UIImage(named: myprofileImageList[imageFlag - 1])

    }
}
