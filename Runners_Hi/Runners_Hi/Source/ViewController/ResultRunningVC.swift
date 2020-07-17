//
//  ResultRunningVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ResultRunningVC: UIViewController {

    var RecentModel: RecentMyData<myRecent>?
    var OpponentRecentModel: RecentMyData<opponentRecent>?
    
    var profileImageStruct = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail","iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunnowMeterhair"]
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var myProfileBox: UIImageView!
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myDistanceLabel: UILabel!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var myPaceLabel: UILabel!
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var myTimeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var yourProfileBox: UIImageView!
    @IBOutlet weak var yourNickLabel: UILabel!
    @IBOutlet weak var yourDistanceLabel: UILabel!
    @IBOutlet weak var kmLabel2: UILabel!
    @IBOutlet weak var yourPaceLabel: UILabel!
    @IBOutlet weak var paceLabel2: UILabel!
    @IBOutlet weak var yourTimeLabel: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    @IBAction func detailButtonDidTap(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecentData()
        getRecentOpponentData()
        setLabel()
        setView()
        // Do any additional setup after loading the view.
        
    }
}
extension ResultRunningVC {
    func getRecentData() {
        RecordService.shared.myrecordloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {

            case .success(let res):
                let response = res as! RecentMyData<myRecent>
                self.RecentModel = response
                self.view.reloadInputViews()
                self.myProfileImage.image = UIImage(named: self.profileImageStruct[(self.RecentModel?.result.image as? Int ?? 0) - 1])
                if self.RecentModel?.result.result == 2 {
                    self.resultLabel.text = "TRY AGAIN"
                    self.resultLabel.textColor = UIColor.brownGrey
                }
                let meterDistance = self.RecentModel?.result.distance as? Int ?? 0
                let KmDistance: Double = Double(meterDistance) / 1000
                self.myDistanceLabel.text = String(format: "%.2f", KmDistance)
                if (self.RecentModel?.result.paceMinute as? Int ?? 0) >= 60 {
                    self.myPaceLabel.text = "_'__''"
                } else {
                    self.myPaceLabel.text = "\(self.RecentModel?.result.paceMinute as? Int ?? 0)'\(self.RecentModel?.result.paceSecond as? Int ?? 0)''"
                }
                let timeString = self.RecentModel?.result.time as? String ?? "00:00:00"
                let firstIndex = timeString.index(timeString.startIndex, offsetBy: 3)
                let secondIndex = timeString.index(timeString.endIndex, offsetBy: 0)
                self.myTimeLabel.text = "\(timeString[firstIndex..<secondIndex])"

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
    //yourrecordloading
    func getRecentOpponentData() {
        RecordService.shared.yourrecordloading() {
            [weak self]
            data in
            guard let `self` = self else {return}
            switch data {

            case .success(let res):
                let response = res as! RecentMyData<opponentRecent>
                self.OpponentRecentModel = response
                self.view.reloadInputViews()
                self.yourNickLabel.text = "\(self.OpponentRecentModel?.result.nickname as? String ?? " ")의 기록"
                print(self.OpponentRecentModel?.result.nickname as? String ?? " ","바보똥개")
                let meterDistance = self.OpponentRecentModel?.result.distance as? Int ?? 0
                let KmDistance: Double = Double(meterDistance) / 1000
                self.yourDistanceLabel.text = String(format: "%.2f", KmDistance)
                if (self.OpponentRecentModel?.result.paceMinute as? Int ?? 0) >= 60 {
                    self.yourPaceLabel.text = "_'__''"
                } else {
                    self.yourPaceLabel.text = "\(self.OpponentRecentModel?.result.paceMinute as? Int ?? 0)'\(self.OpponentRecentModel?.result.paceSecond as? Int ?? 0)''"
                }
                let timeString = self.OpponentRecentModel?.result.time as? String ?? "00:00:00"
                let firstIndex = timeString.index(timeString.startIndex, offsetBy: 3)
                let secondIndex = timeString.index(timeString.endIndex, offsetBy: 0)
                self.yourTimeLabel.text = "\(timeString[firstIndex..<secondIndex])"

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
    func setLabel() {
        
        resultLabel.text = "WINNER"
        resultLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 46)
        resultLabel.textColor = UIColor.lightishBlue
        
        kmLabel.text = "킬로미터"
        kmLabel.font = UIFont(name: "NanumSquare", size: 14)
        kmLabel.textColor = UIColor.brownishGrey
        
        paceLabel.text = "평균 페이스"
        paceLabel.font = UIFont(name: "NanumSquare", size: 14)
        paceLabel.textColor = UIColor.brownishGrey
        
        timeLabel.text = "러닝 시간"
        timeLabel.font = UIFont(name: "NanumSquare", size: 14)
        timeLabel.textColor = UIColor.brownishGrey
        
        myDistanceLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 44)
        myPaceLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 36)
        myTimeLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 44)
        
        
        kmLabel2.text = "킬로미터"
        kmLabel2.font = UIFont(name: "NanumSquare", size: 12)
        kmLabel2.textColor = UIColor.brownishGrey
        
        paceLabel2.text = "페이스"
        paceLabel2.font = UIFont(name: "NanumSquare", size: 12)
        paceLabel2.textColor = UIColor.brownishGrey
        
        timeLabel2.text = "러닝 시간"
        timeLabel2.font = UIFont(name: "NanumSquare", size: 12)
        timeLabel2.textColor = UIColor.brownishGrey
        
        yourNickLabel.font = UIFont(name: "NanumSquare", size: 14)
        yourDistanceLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 26)
        yourPaceLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 26)
        yourTimeLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 26)
        
        detailButton.titleLabel?.text = "기록 자세히 보기"
        detailButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        detailButton.titleLabel?.textColor = .white
        detailButton.tintColor = UIColor.lightishBlue
    }
    func setView() {
        
        view.backgroundColor = UIColor.backgroundgray
        
        shareButton.setBackgroundImage(UIImage(named: "iconShare"), for: .normal)
        shareButton.setTitle(nil, for: .normal)
        
        myProfileBox.image = UIImage(named: "whiteboxRecdetailactivityMyrecord")
        yourProfileBox.image = UIImage(named: "whiteboxRecdetailactivityAnoterrunnerrecord")
        
        
        
    }
}
