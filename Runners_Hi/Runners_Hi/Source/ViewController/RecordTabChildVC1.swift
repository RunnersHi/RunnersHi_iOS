//
//  ChildRecordVC1.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class RecordTabChildVC1: UIViewController, IndicatorInfoProvider {
    
        var RecordModel: RecordAllData?
    @IBOutlet weak var scoreRecordCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        scoreRecordCollectionView.dataSource = self
        scoreRecordCollectionView.delegate = self
        super.viewDidLoad()
        getRecord()
        self.scoreRecordCollectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "러닝기록")
    }
}


extension RecordTabChildVC1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecordModel?.result.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let ScoreRecordCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScoreRecordCell.identifier, for: indexPath) as? ScoreRecordCell else { return UICollectionViewCell()}
        
      
        let m: Float = Float(RecordModel?.result[indexPath.row].distance ?? 0)
        let km : Float = round(m*10)/1000
        ScoreRecordCell.scoreDateLabel.text = RecordModel?.result[indexPath.row].date
        ScoreRecordCell.getKmLabel.text = "\(km)"
        ScoreRecordCell.getTimeLabel.text = RecordModel?.result[indexPath.row].time
        
        let timeLabel = RecordModel?.result[indexPath.row].time
        let hourLabel = RecordModel?.result[indexPath.row].time.components(separatedBy: ":")[0]
        if hourLabel == "00" {
             ScoreRecordCell.getTimeLabel.text = String(timeLabel!.components(separatedBy: ":")[1] + ":" + timeLabel!.components(separatedBy: ":")[2])
        }
        
        if RecordModel?.result[indexPath.row].result == 1 {
            ScoreRecordCell.recordBackImage.image = UIImage(named: "bluelineRecbadgefragmentWinnerrecord")
        }
        else {
            ScoreRecordCell.recordBackImage.image = UIImage(named: "graylineboxRecbadgefragmentMyrecord")
        }
        
        return ScoreRecordCell
    }
}


extension RecordTabChildVC1: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt IndexPath: IndexPath) -> CGSize{
                return CGSize(width: 175, height: 175)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return UIEdgeInsets(top: 17, left: 11, bottom: 11, right: 11)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
                return 6
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
                return 3
        }
        
    }

extension RecordTabChildVC1 {
    func getRecord(){
        RecordService.shared.recordloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {
                
            case .success(let res):
                let response = res as! RecordAllData
                self.RecordModel = response
                self.scoreRecordCollectionView.reloadData()
                
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






