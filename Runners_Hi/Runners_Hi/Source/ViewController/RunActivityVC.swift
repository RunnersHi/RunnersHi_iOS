///
//  RunActivityVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/11.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import HealthKit

class RunActivityVC: UIViewController {
    
    
    let healthStore = HKHealthStore()
    var moveTime: Float = 0.0
    var maxTime: Float = 0.0
    
    @IBOutlet weak var lockButton: UIButton!
    @IBOutlet weak var backBoxImage: UIImageView!
    
    @IBOutlet weak var opponentImage: UIImageView!
    @IBOutlet weak var opponentNickLabel: UILabel! // 상대방 닉네임
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var opponentLevelLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var finishTimeLabel: UILabel!
    
    @IBOutlet weak var runProgressBar: UIProgressView!
    
    @IBOutlet weak var runningInfoView: UIView!
    
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var opponentKmLabel: UILabel!
    
    
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var opponentLeftTimeLabel: UILabel!
    
    @IBOutlet weak var paceLabel: UILabel!
    @IBOutlet weak var opponentPaceLabel: UILabel!
    
    @IBOutlet weak var voiceLabel: UILabel!
    @IBOutlet weak var voiceOnButton: UIButton!
    @IBOutlet weak var voiceOffButton: UIButton!
    
    @IBOutlet weak var runningStopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTodaysSteps { stepCount in
            print(stepCount)
        }
        setView()
        setLabel()
        // Do any additional setup after loading the view.
        
    }
     
    private func getTodaysSteps(completion: @escaping (Double) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
       // Calendar.current.startOfDay(for: )
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
                guard let result = result, let sum = result.sumQuantity() else {
                    completion(0.0)
                    return
                }
                
                print(sum)
                completion(sum.doubleValue(for: HKUnit.count()))
            }
        healthStore.execute(query)
        
            
            
        }
    }



extension RunActivityVC {
    func setLabel() {

        levelLabel.text = "Lv."
        levelLabel.font = UIFont(name: "NanumSquare", size: 12)
        
        scoreLabel.text = "전적"
        scoreLabel.font = UIFont(name: "NanumSquare", size: 12)
        
        opponentNickLabel.font = UIFont(name: "NanumSquareB", size: 12)
        opponentLevelLabel.font = UIFont(name: "NanumSquareB", size: 14)
        opponentScoreLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        startTimeLabel.text = "00:00"
        startTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        //finishTimeLabel.text
        finishTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        kmLabel.text = "킬로미터"
        kmLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        leftTimeLabel.text = "남은시간"
        leftTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        paceLabel.text = "페이스"
        paceLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        //opponentKmLabel.text
        opponentKmLabel.font = UIFont(name: "NanumSquareB", size: 70)
        
        //opponentLeftTimeLabel.text
        opponentLeftTimeLabel.font = UIFont(name: "NanumSquareB", size: 70)
        
        //opponentPaceLabel.text
        opponentPaceLabel.font = UIFont(name: "NanumSquareB", size: 36)
    }
    
    func setView() {
        
        perform(#selector(runProgressbar), with: nil, afterDelay: 1.0)
        
        lockButton.setBackgroundImage(UIImage(named: "iconUnlock"), for: .normal)
        lockButton.setTitle(nil, for: .normal)
        
        //backBoxImage.image = UIImage(named: <#T##String#>)
        //opponentImage.image = UIImage(named: <#T##String#>)
        runningInfoView.backgroundColor = UIColor.salmon
        runningInfoView.layer.cornerRadius = 12
        
        voiceLabel.text = "음성 피드백"
        voiceLabel.font = UIFont(name: "NanumSquareB", size: 18)
        
        voiceOnButton.setTitle("ON", for: .normal)
        voiceOnButton.backgroundColor = UIColor.lightishBlue
        voiceOnButton.setTitleColor(.white, for: .normal)
        voiceOnButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 14)
        voiceOnButton.layer.cornerRadius = 8
        
        voiceOffButton.setTitle("OFF", for: .normal)
        voiceOffButton.backgroundColor = UIColor.brownishGrey
        voiceOffButton.setTitleColor(.white, for: .normal)
        voiceOffButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 14)
        voiceOffButton.layer.cornerRadius = 8
        
        runningStopButton.setTitle("러닝 경쟁 중단하기", for: .normal)
        runningStopButton.backgroundColor = UIColor.brownishGrey
        runningStopButton.setTitleColor(.white, for: .normal)
        runningStopButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        runningStopButton.layer.cornerRadius = 8
    }
    @objc func runProgressbar() {
        moveTime = moveTime + 1.0
        runProgressBar.progress = moveTime/maxTime
        if moveTime < maxTime {
            perform(#selector(runProgressbar), with: nil, afterDelay: 1.0)
        } else {
            print("끝")
            moveTime = 0.0
        }
    }
}
