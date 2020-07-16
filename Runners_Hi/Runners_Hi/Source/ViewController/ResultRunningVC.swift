//
//  ResultRunningVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit

class ResultRunningVC: UIViewController {

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

        // Do any additional setup after loading the view.
    }


}
extension ResultRunningVC {
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
        
        myProfileBox.image = UIImage(named: "whiteboxResultactivityMyrecord")
       // myProfileImage.image = UIImage(named: <#T##String#>)
        
        yourProfileBox.image = UIImage(named: "whiteboxResultactivityAnoterrunnerrecord")
        
        
        
    }
}
