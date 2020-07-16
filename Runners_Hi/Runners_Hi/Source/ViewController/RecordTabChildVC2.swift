//
//  RecordTabChildVC2.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class RecordTabChildVC2: UIViewController, IndicatorInfoProvider {
    @IBOutlet weak var badgeCollectionView: UICollectionView!
    var BadgeRecordModel: RecordAllData2?
    
    override func viewDidLoad() {
        
        badgeCollectionView.dataSource = self
        badgeCollectionView.delegate = self
        getBadge()
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
           return IndicatorInfo(title: "러닝뱃지")
       }
}


extension RecordTabChildVC2: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return BadgeRecordModel?.result.badge.count ?? 0
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let BadgeCell = collectionView.dequeueReusableCell(withReuseIdentifier: BadgeCell.identifier, for: indexPath) as? BadgeCell else { return UICollectionViewCell()}
    
    let beforeBadgeImage = ["imgBadgeEggEmpty","imgBadgeChickEmpty","imgBadgeChickenEmpty","imgBadgeBatEmpty","imgBadgeBirdEmpty", "imgBadgeTurtleEmpty","imgBadge50Empty","imgBadge100Empty","imgBadge150Empty","imgBadgeStraightEmpty","imgBadgeSpeedEmpty","imgBadgeFlame"]
    
    let badgeImage = ["imgBadgeEgg","imgBadgeChick","imgBadgeChicken","imgBadgeBat","imgBadgeBird", "imgBadgeTurtle","imgBadge50","imgBadge100","imgBadge150","imgBadgeStraight","imgBadgeSpeed","imgBadgeFlame"]
    
    let badgeLabel = ["첫승달성","10승 달성", "50승 달성", "최고 페이스", "최장 거리", "최저 페이스", "50시간 달성", "100시간 달성", "150시간 달성", "10일 연속 러닝", "연속 5승", "연속 10승"]
    
    let badgeList = BadgeRecordModel?.result.badge
    if badgeList?[indexPath.row] == false {
        BadgeCell.getBadge.image = UIImage(named: beforeBadgeImage[indexPath.row])
//        UIImage(named: beforeBadgeImage[indexPath.row])
//        UIImage(contentsOfFile: beforeBadgeImage[indexPath.row])
    }
    else {
        BadgeCell.getBadge.image = UIImage(named: badgeImage[indexPath.row])
    }
    
    BadgeCell.getBadgeLabel.text = badgeLabel[indexPath.row]
    
   
    
    return BadgeCell }
}


extension RecordTabChildVC2: UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
            return CGSize(width: 80, height: 137)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 20, left: 37, bottom: 24, right: 38)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
            return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
            return 30
    }
    
}

extension RecordTabChildVC2 {
    func getBadge(){
        BadgeService.shared.badgeloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! RecordAllData2
                self.BadgeRecordModel = response
                self.badgeCollectionView.reloadData()
                
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
