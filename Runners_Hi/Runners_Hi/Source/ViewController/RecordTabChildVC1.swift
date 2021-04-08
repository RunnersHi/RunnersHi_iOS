//
//  ChildRecordVC1.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class RecordTabChildVC1: UIViewController {
    
        var RecordModel: RecordAllData<Result>?
    @IBOutlet weak var scoreRecordCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .backgroundgray
        self.scoreRecordCollectionView.backgroundColor = .backgroundgray
        scoreRecordCollectionView.dataSource = self
        scoreRecordCollectionView.delegate = self
        super.viewDidLoad()
        getRecord()
        self.scoreRecordCollectionView.reloadData()
    }
    
}


extension RecordTabChildVC1: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 20
        return RecordModel?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let ScoreRecordCell = collectionView.dequeueReusableCell(withReuseIdentifier: ScoreRecordCell.identifier, for: indexPath) as? ScoreRecordCell else { return UICollectionViewCell()}
        
        

        // date값 받아오기. nil 값이라면 더미 표시
        ScoreRecordCell.scoreDateLabel.text = RecordModel?.data[indexPath.row].date
        if((RecordModel?.data[indexPath.row].date) == nil){
            ScoreRecordCell.scoreDateLabel.text = "0000.00.00"

        }
        
//        if((RecordModel?.data[indexPath.row].date) != nil) {
//            ScoreRecordCell.scoreDateLabel.text = RecordModel?.data[indexPath.row].date
//        }
//        else {
//            ScoreRecordCell.scoreDateLabel.text = "0000.00.00"
//        }
        
        // 거리 값 받아오기.
        let m: Float = Float(RecordModel?.data[indexPath.row].distance ?? 0)
        let km : Float = round(m*10)/1000
        ScoreRecordCell.getKmLabel.text = "\(km)"

        // 시간값 받아오기.
        let runTime: Int = Int(RecordModel?.data[indexPath.row].time ?? 1111)
        print(runTime)
        ScoreRecordCell.getTimeLabel.text = "\(runTime)"

//  시간값 받아오기. nil 값이라면 더미 표시
//        if (RecordModel?.data[indexPath.row].time != nil){
//        ScoreRecordCell.getTimeLabel.text = RecordModel?.data[indexPath.row].time
//        }
//        else {
//        ScoreRecordCell.getTimeLabel.text = "00:00:00"
//        }
//
//
//        let timeLabel = RecordModel?.data[indexPath.row].time
//        let hourLabel = RecordModel?.data[indexPath.row].time.components(separatedBy: ":")[0]
//        if hourLabel == "00" {
//             ScoreRecordCell.getTimeLabel.text = String(timeLabel!.components(separatedBy: ":")[1] + ":" + timeLabel!.components(separatedBy: ":")[2])
//        }
        
        if RecordModel?.data[indexPath.row].result == 1 {
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
        return CGSize(width: (self.view.frame.width / 2)-22, height: (self.view.frame.width / 2)-22)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
                return UIEdgeInsets(top: 35, left: 11, bottom: 11, right: 11)
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
                let response = res as? RecordAllData<Result>
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






