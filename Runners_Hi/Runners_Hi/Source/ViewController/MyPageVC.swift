//
//  MyPageVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/06.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController, UICollectionViewDelegate {
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
        // 서버와 연결되지 않았을 때도 빈 카드가 뜨도록 개수를 설정한다.
        return 9
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let ProfileBadgeCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileBadgeCell.identifier, for: indexPath) as? ProfileBadgeCell else { return UICollectionViewCell()}
        
        // 해당 셀에 데이터를 전달하고, 데이터에 맞게 뱃지를 세팅하도록 하는 함수를 호출한다
        ProfileBadgeCell.setMyProfileBadgeData(data: MyProfileModel, index: indexPath.row)
        
        return ProfileBadgeCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let MyProfileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MyProfileHeader.identifier, for: indexPath) as? MyProfileHeader else { return UICollectionViewCell()}
            
            // MyProfileHeader에 데이터를 넘겨주고, 해당 데이터를 바탕으로 헤더의 내용을 채워주는 함수이다.
            MyProfileHeader.myPageHeaderData(data: MyProfileModel)
            
            return MyProfileHeader
        default: assert(false, "오류")
            
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            let width: CGFloat = collectionView.frame.width
            let height: CGFloat = 359
            return CGSize(width: width, height: height) }
        
    }
}
extension MyPageVC: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
        return CGSize(width: 80, height: 143)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 37, bottom: 24, right: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 30
    }
}

extension MyPageVC {
    // Mark: Function
    func myPageStyle(){
        // 뷰의 배경색과 컬렉션 뷰의 배경 색을 세팅해준다.
        self.view.backgroundColor = .backgroundgray
        self.myPageCollectionView.backgroundColor = .backgroundgray
        
        // 컬렉션 뷰 dataSource와 delegate를 세팅해준다.
        self.myPageCollectionView.dataSource = self
        self.myPageCollectionView.delegate = self
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

