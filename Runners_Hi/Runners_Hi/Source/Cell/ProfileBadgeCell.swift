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
    
    // 해당 셀에 데이터를 전달하고, 이에 맛게 뱃지를 표시하도록 하는 함수
    func setMyProfileBadgeData(data: MyProfile?, index: Int){
        // 달성하지 못한 배지의 이미지 이름 리스트
        let myProfileBeforeBadgeImage = ["imgBadgeEggEmpty","imgBadgeChickEmpty","imgBadgeChickenEmpty","imgBadgeBatEmpty","imgBadgeBirdEmpty", "imgBadgeTurtleEmpty","imgBadge50Empty","imgBadge100Empty","imgBadge150Empty","imgBadgeStraightEmpty","imgBadgeSpeedEmpty","imgBadgeFlameEmpty"]
        
        // 달성한 배지의 이미지 이름 리스트
        let myProfileBadgeImage = ["imgBadgeEgg","imgBadgeChick","imgBadgeChicken","imgBadgeBat","imgBadgeBird", "imgBadgeTurtle","imgBadge50","imgBadge100","imgBadge150","imgBadgeStraight","imgBadgeSpeed","imgBadgeFlame"]
        
        // 배지의 이름 리스트
        let myProfileBadgeLabel = ["첫승달성","10승 달성", "50승 달성", "최고 페이스", "최장 거리", "최저 페이스", "50시간 달성", "100시간 달성", "150시간 달성", "10일 연속 러닝", "연속 5승", "연속 10승"]
        
        // 서버로부터 사용자의 뱃지 정보를 받아온다
        let profileBadgeList = data?.result.badge ?? [true, false,false,false,false,false,false,false,false,false,false,false]
        print("나오냐?", profileBadgeList, index)
        
        // 모든 배지의 이름을 맞춰서 넣어준다.
        myProfileName.text = myProfileBadgeLabel[index]
        
        // 사용자로부터 받아온 배지 정보가 false 라면 달성하지 못한 배지로 여기고
        // 달성하지 못한 배지의 이미지를 삽입한다
        if profileBadgeList[index] == false {
            myProfileBadge.image = UIImage(named: myProfileBeforeBadgeImage[index])
            // false일 때는 item select 안되도록 설정
            isUserInteractionEnabled = false
        }
        // 사용자로부터 받아온 배지 정보가 true인 경우
        // 달성한 배지의 이미지를 삽입한다.
        else {
            myProfileBadge.image = UIImage(named: myProfileBadgeImage[index])
            // True일 대는 item이 select 가능하도록 설정해준다
            isUserInteractionEnabled = true
        }

    }
}
