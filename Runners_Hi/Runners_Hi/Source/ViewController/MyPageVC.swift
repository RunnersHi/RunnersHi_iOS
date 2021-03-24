//
//  MyPageVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/06.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {
    static let identifier: String = "MyPageVC"
    
    // Mark: Variable Part
    var MyProfileModel: MyProfile?
    
    // Mark: IBOutlet
    @IBOutlet weak var myPageCollectionView: UICollectionView!
    
    // Mark: Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        myPageStyle()
        getProfileBadge()
    }
}

// Mark: Extension
extension MyPageVC: UICollectionViewDataSource {
    // Mark: Function
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 서버와 연결되지 않았을 때도 빈 카드가 뜨도록 상수 설정
        return 9    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let ProfileBadgeCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileBadgeCell.identifier, for: indexPath) as? ProfileBadgeCell else { return UICollectionViewCell()}

     let myProfileBeforeBadgeImage = ["imgBadgeEggEmpty","imgBadgeChickEmpty","imgBadgeChickenEmpty","imgBadgeBatEmpty","imgBadgeBirdEmpty", "imgBadgeTurtleEmpty","imgBadge50Empty","imgBadge100Empty","imgBadge150Empty","imgBadgeStraightEmpty","imgBadgeSpeedEmpty","imgBadgeFlameEmpty"]
     
     let myProfileBadgeImage = ["imgBadgeEgg","imgBadgeChick","imgBadgeChicken","imgBadgeBat","imgBadgeBird", "imgBadgeTurtle","imgBadge50","imgBadge100","imgBadge150","imgBadgeStraight","imgBadgeSpeed","imgBadgeFlame"]
     
     let myProfileBadgeLabel = ["첫승달성","10승 달성", "50승 달성", "최고 페이스", "최장 거리", "최저 페이스", "50시간 달성", "100시간 달성", "150시간 달성", "10일 연속 러닝", "연속 5승", "연속 10승"]
     
     let profileBadgeList = MyProfileModel?.result.badge
     if profileBadgeList?[indexPath.row] == false {
         ProfileBadgeCell.myProfileBadge.image = UIImage(named: myProfileBeforeBadgeImage[indexPath.row])
        
        // false일 때는 item select 안되도록 설정
        ProfileBadgeCell.isUserInteractionEnabled = false
     }
     else {
         ProfileBadgeCell.myProfileBadge.image = UIImage(named: myProfileBadgeImage[indexPath.row])
        ProfileBadgeCell.isUserInteractionEnabled = true
     }
     
     ProfileBadgeCell.myProfileName.text = myProfileBadgeLabel[indexPath.row]
     
     
     return ProfileBadgeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let level = self.MyProfileModel?.result.level ?? 0
            let win = self.MyProfileModel?.result.win ?? 0
            let lose = self.MyProfileModel?.result.lose ?? 0
            let name:String = self.MyProfileModel?.result.nickname ?? ""
            
            let  myprofileImageList = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail", "iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunhair"]
            
            let levelList = ["초급","중급","고급"]
            guard let MyProfileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyProfileHeader.identifier, for: indexPath) as? MyProfileHeader else { return UICollectionViewCell()}
            
            let myprofileImageFlag:Int = self.MyProfileModel?.result.image as? Int ?? 0
            
            
            MyProfileHeader.myProfileImage.image = UIImage(named: myprofileImageList[myprofileImageFlag - 1])
            MyProfileHeader.myProfileBack.image = UIImage(named: "whiteboxRecdetailactivityMyrecord")
            
            MyProfileHeader.LvLabel?.text = "\(levelList[level-1])"
            MyProfileHeader.ScoreLabel?.text = "\(win)" + "승 " + "\(lose)" + "패"
            MyProfileHeader.myProfileName?.text = name
            

            return MyProfileHeader
             default: assert(false, "응 아니야") }
        
        
        }
    
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 359
        return CGSize(width: width, height: height) }
    
}

extension MyPageVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
            return CGSize(width: 80, height: 137)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 37, bottom: 24, right: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
            return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
            return 30
    }
}

extension MyPageVC {
    // Mark: Function
    func myPageStyle(){
        self.view.backgroundColor = .backgroundgray
        self.myPageCollectionView.backgroundColor = .backgroundgray
    }
    
    // Mark: Function Network
    func getProfileBadge(){
        MyProfileService.shared.profilebadgeloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! MyProfile
                self.MyProfileModel = response
                self.myPageCollectionView.reloadData()
                self.myPageCollectionView.dataSource = self
                self.myPageCollectionView.delegate = self

                
            case .requestErr:
                print(".requestErr")
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                print(".networkFail")
            }
            
        }
    }
}
