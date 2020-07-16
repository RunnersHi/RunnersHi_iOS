///
//  RunActivityVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/11.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
//import HealthKit
import CoreMotion
import SocketIO

class RunActivityVC: UIViewController {
    
    let stopColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    let startColor = UIColor(red: 0.0, green: 0.75, blue: 0.0, alpha: 1.0)
    // values for the pedometer data
    var numberOfSteps:Int! = nil
    var finalKm:Int = 0
    var distance:Double! = nil
    var averagePace:Double! = nil
    var pace:Double! = nil
    var kmDistance:Double! = nil
     
    //the pedometer
    var pedometer = CMPedometer()
     
    // timers
    var timer = Timer()
    var timerInterval = 1.0
    var timeElapsed:TimeInterval = 1.0
    //
    
    //let healthStore = HKHealthStore()
    var moveTime: Float = 0.0
    //var maxTime: Float = UserDefaults.standard.object(forKey: "myGoalTime") as? Float ?? 0
    var maxTime: Float = 60.0
    var limitTime: Int = UserDefaults.standard.object(forKey: "myGoalTime") as? Int ?? 0
    var nowKmeter: Double = 0.0
    var get5secKm: Double = 0.0
    var myMeter: Double = 0.0
    var levelStruct = ["초급","중급","고급"]
    var profileImageStruct = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail","iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunnowMeterhair"]
    var formatter = DateFormatter()
    
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
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        UserDefaults.standard.set(formatter.string(from: Date()), forKey: "createdTime")
        secToTime(sec: limitTime)
        pedometer = CMPedometer()
        startTimer()
        pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
            if let pedData = pedometerData{
                self.numberOfSteps = Int(pedData.numberOfSteps)
                //self.stepsLabel.text = "Steps:\(pedData.numberOfSteps)"
                if let distance = pedData.distance{
                    self.distance = Double(distance)
                }
                if let averageActivePace = pedData.averageActivePace {
                    self.averagePace = Double(averageActivePace)
                }
                if let currentPace = pedData.currentPace {
                    self.pace = Double(currentPace)
                }
            } else {
                self.numberOfSteps = nil
            }
        })
        FindRunnerVC.socket.on("endRunning", callback: { (data, ack) in
            UserDefaults.standard.set(self.formatter.string(from: Date()), forKey: "endTime")
            guard let FinishRun = self.storyboard?.instantiateViewController(identifier:"RunFinishVC") as? RunFinishVC else {return}
            self.navigationController?.pushViewController(FinishRun, animated: true)
        })
            
        
        
        perform(#selector(runProgressbar), with: nil, afterDelay: 0.0)

        super.viewDidLoad()
        setView()
        setLabel()
        setOpponentProfile()
        

       // FindRunnerVC.shared.startSocket()
        //perform(#selector(get5secKmeter), with: nil, afterDelay: 5.0)
        
        
    }
}



extension RunActivityVC {
    func startTimer(){
        if timer.isValid { timer.invalidate() }
        timer = Timer.scheduledTimer(timeInterval: timerInterval,target: self,selector: #selector(timerAction(timer:)) ,userInfo: nil,repeats: true)
    }
    @objc func timerAction(timer:Timer){
        displayPedometerData()
    }
    func displayPedometerData(){
        timeElapsed += 1.0
        print("붸",timeElapsed)
        //statusTitle.text = "On: " + timeIntervalFormat(interval: timeElapsed)
        //Number of steps
//        if let numberOfSteps = self.numberOfSteps{
//            stepsLabel.text = String(format:"Steps: %i",numberOfSteps)
//        }
         
        //distance
        if let distance = self.distance {
        opponentKmLabel.text = String(format:"%02.02f",distance/1000)
            
            print(distance,moveTime,"요기요~~")
            let pace1 = Int(moveTime/Float(distance/1000))
            let pace2 = Int(pace1/60)
            let pace3 = Int(pace1%60)
            print(pace1,pace2,pace3,"하잉용")
            if pace2 >= 60 {
                opponentPaceLabel.text = "_'__''"
            } else {
            opponentPaceLabel.text = String(pace2) + "'" + String(pace3) + "''"
            }
            
        }

   }
    
    
    func miles(meters:Double)-> Double{
        let mile = 0.000621371192
        return meters * mile
    }
    
    func setLabel() {

       // perform(#selector(getSetTime), with: nil, afterDelay: 0.0)
        levelLabel.text = "Lv."
        levelLabel.font = UIFont(name: "NanumSquare", size: 12)
        
        scoreLabel.text = "전적"
        scoreLabel.font = UIFont(name: "NanumSquare", size: 12)
        
        opponentNickLabel.font = UIFont(name: "NanumSquareB", size: 12)
        opponentLevelLabel.font = UIFont(name: "NanumSquareB", size: 14)
        opponentScoreLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        startTimeLabel.text = "00:00"
        startTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)

        if maxTime == 1800.0 {
            finishTimeLabel.text = "30:00"
        } else if maxTime == 2700.0 {
            finishTimeLabel.text = "40:00"
        } else if maxTime == 3600.0 {
            finishTimeLabel.text = "1:00:00"
        } else {
            finishTimeLabel.text = "1:30:00"
        }
       // finishTimeLabel.text = maxTime
        finishTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        kmLabel.text = "킬로미터"
        kmLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        leftTimeLabel.text = "남은시간"
        leftTimeLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        paceLabel.text = "페이스"
        paceLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
        opponentKmLabel.text = "0.00"
        opponentKmLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 70)
        
        opponentLeftTimeLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 70)
        
        opponentPaceLabel.text = "_'__''"
        opponentPaceLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 36)
        
    }
    
    func setView() {
        
        lockButton.setBackgroundImage(UIImage(named: "iconUnlock"), for: .normal)
        lockButton.setTitle(nil, for: .normal)
        
        backBoxImage.image = UIImage(named: "runactivityWhitebox")
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
    
    func setOpponentProfile() {
        let inputLevel = UserDefaults.standard.object(forKey: "opponentLevel") ?? 0
        let inputNick = UserDefaults.standard.object(forKey: "opponentNick") ?? " "
        let inputWin = UserDefaults.standard.object(forKey: "opponentWin") ?? 0
        let inputLose = UserDefaults.standard.object(forKey: "opponentLose") ?? 0
        let inputImage = UserDefaults.standard.object(forKey: "opponentImg") ?? 0
        
        opponentImage.image = UIImage(named: profileImageStruct[(inputImage as? Int ?? 0) - 1])
        opponentNickLabel.text = inputNick as? String ?? " "
        opponentScoreLabel.text = "\(inputWin as? Int ?? 0)승 \(inputLose as? Int ?? 0)패"
        opponentLevelLabel.text = levelStruct[(inputLevel as? Int ?? 0) - 1]
        
    }
    
    @objc func runProgressbar() {
        if moveTime < maxTime {
            moveTime = moveTime + 1.0
            runProgressBar.progress = moveTime/maxTime
            perform(#selector(runProgressbar), with: nil, afterDelay: 1.0)
        } else {
            print("끝")
            moveTime = 0.0
            UserDefaults.standard.set(distance, forKey: "opponetDistance")
            FindRunnerVC.socket.emit("endRunning", UserDefaults.standard.object(forKey: "opponentRoom") as? String ?? " ",UserDefaults.standard.object(forKey: "opponetDistance") as? Int ?? 2 )
        }
    }
        func secToTime(sec: Int){
           let hour = sec / 3600
           let minute = (sec % 3600) / 60
           let second = (sec % 3600) % 60
            if hour == 0 {
                opponentLeftTimeLabel.text = String(minute) + ":" + String(second)
            } else if minute == 0 {
                opponentLeftTimeLabel.text = String(second)
            } else {
                opponentLeftTimeLabel.text = String(hour) + ":" + String(minute) + ":" + String(second)
            }
           
           print("여기",String(hour) + ":" + String(minute) + ":" + String(second))
            if moveTime < maxTime {
                perform(#selector(getSetTime), with: nil, afterDelay: 1.0)
            }

       }
        @objc func getSetTime() {
        if moveTime < maxTime {
            secToTime(sec: limitTime)
            limitTime = limitTime - 1
            } else {
                opponentLeftTimeLabel.text = "00:00:00"
            }
//        else if moveTime == maxTime {
//            print("뇸")
//            finalKm = Int(distance)
//            print(finalKm,"똥",type(of: finalKm))
//                guard let FindRunnerVC = self.storyboard?.instantiateViewController(identifier:"FindRunnerVC") as? FindRunnerVC else {return}
//                FindRunnerVC.finishRun(distance: finalKm)
//            }

    }

}
