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
        self.myPageCollectionView.dataSource = self
        self.myPageCollectionView.delegate = self
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
        
        // 달성하지 못한 배지의 이미지 이름 리스트
        let myProfileBeforeBadgeImage = ["imgBadgeEggEmpty","imgBadgeChickEmpty","imgBadgeChickenEmpty","imgBadgeBatEmpty","imgBadgeBirdEmpty", "imgBadgeTurtleEmpty","imgBadge50Empty","imgBadge100Empty","imgBadge150Empty","imgBadgeStraightEmpty","imgBadgeSpeedEmpty","imgBadgeFlameEmpty"]
        
        // 달성한 배지의 이미지 이름 리스트
        let myProfileBadgeImage = ["imgBadgeEgg","imgBadgeChick","imgBadgeChicken","imgBadgeBat","imgBadgeBird", "imgBadgeTurtle","imgBadge50","imgBadge100","imgBadge150","imgBadgeStraight","imgBadgeSpeed","imgBadgeFlame"]
        
        // 배지의 이름 리스트
        let myProfileBadgeLabel = ["첫승달성","10승 달성", "50승 달성", "최고 페이스", "최장 거리", "최저 페이스", "50시간 달성", "100시간 달성", "150시간 달성", "10일 연속 러닝", "연속 5승", "연속 10승"]
        
        // 서버로부터 사용자의 뱃지 정보를 받아온다
        let profileBadgeList = MyProfileModel?.result.badge
        
        // 사용자로부터 받아온 배지 정보가 false 라면 달성하지 못한 배지로 여기고
        // 달성하지 못한 배지의 이미지를 삽입한다
        if profileBadgeList?[indexPath.row] == false {
            ProfileBadgeCell.myProfileBadge.image = UIImage(named: myProfileBeforeBadgeImage[indexPath.row])
            // false일 때는 item select 안되도록 설정
            ProfileBadgeCell.isUserInteractionEnabled = false
        }
        // 사용자로부터 받아온 배지 정보가 true인 경우
        // 달성한 배지의 이미지를 삽입한다.
        else {
            ProfileBadgeCell.myProfileBadge.image = UIImage(named: myProfileBadgeImage[indexPath.row])
            // True일 대는 item이 select 가능하도록 설정해준다
            ProfileBadgeCell.isUserInteractionEnabled = true
        }
        // 모든 배지의 이름을 맞춰서 넣어준다.
        ProfileBadgeCell.myProfileName.text = myProfileBadgeLabel[indexPath.row]
        
        return ProfileBadgeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            
            
            guard let MyProfileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyProfileHeader.identifier, for: indexPath) as? MyProfileHeader else { return UICollectionViewCell()}
            
            // MyProfileHeader에 데이터를 넘겨주고, 해당 데이터를 바탕으로 헤더의 내용을 채워주는 함수이다.
            MyProfileHeader.myPageHeaderData(data: MyProfileModel)
            
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
                
                // 오늘 하루종일 아무것도 못했는데, 그 이유를 여기서 찾았다.
                // 바보같은 과거의 최영재. 과영재는 서버 통신에 성공했을 때에만 datasource,delegate를 self를 해주는 바보같은 과오를 저지르고 말았다.
                // 하지만 난 이제 더 나아질 수 있다. 왜냐하면 이 문제를 발견했기 때문이다.
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
