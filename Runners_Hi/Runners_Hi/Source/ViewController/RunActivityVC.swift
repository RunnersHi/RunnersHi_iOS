///
//  RunActivityVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/11.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion
import NMapsMap
import SocketIO

class RunActivityVC: UIViewController, CLLocationManagerDelegate {
    
    // MARK: Variable Part
    
    var numberOfSteps: Int?
    var distance: Double?
    var averagePace: Double?
    var pace: Double?
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var pedometer = CMPedometer()
    var move: Int = 0
    var timer = Timer()
    var timerInterval = 1.0
    
    var moveTime: Float = 0.0
    var maxTime: Float = UserDefaults.standard.float(forKey: "myGoalTime")
    var limitTime: Int = UserDefaults.standard.integer(forKey: "myGoalTime")
    
    var formatter = DateFormatter()
    
    // MARK: IBOutlet
    
    @IBOutlet weak var scrolleView: UIScrollView!
    
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
    
    @IBOutlet var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var naverView: UIView!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        
        userElapsedTimeCount(sec: limitTime)
        startTimer()
        
        pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
            if let pedData = pedometerData {
                self.numberOfSteps = Int(pedData.numberOfSteps)
                //self.stepsLabel.text = "Steps:\(pedData.numberOfSteps)"
                if let distance = pedData.distance {
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
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        UserDefaults.standard.set(formatter.string(from: Date()), forKey: "createdTime")
        FindRunnerVC.socket.on("endRunning", callback: { (data, ack) in
            UserDefaults.standard.set(self.formatter.string(from: Date()), forKey: "endTime")
            guard let FinishRun = self.storyboard?.instantiateViewController(identifier:"RunFinishVC") as? RunFinishVC else {return}
            self.navigationController?.pushViewController(FinishRun, animated: true)
        })
        
        
        perform(#selector(runProgressbar), with: nil, afterDelay: 1.0)
        
        super.viewDidLoad()
        setMap()
        setView()
        setLabel()
        setOpponentProfile()
        
    }
}

// MARK: Extension

extension RunActivityVC {
    
    func startTimer() {
        
        if timer.isValid {
            
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: timerInterval,target: self,selector: #selector(timerAction(timer:)) ,userInfo: nil,repeats: true)
    }
    
    @objc func timerAction(timer:Timer) {
        
        if let distance = self.distance {
            
            opponentKmLabel.text = String(format:"%02.02f", distance/1000)
            let pace1 = Int(moveTime/Float(distance/1000))
            let pace2 = Int(pace1/60)
            let pace3 = Int(pace1%60)
            
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
        
        levelLabel.setLabel(text: "Lv.", color: .black, font: .nanumRegular(size: 12))
        
        scoreLabel.setLabel(text: "전적", color: .black, font: .nanumRegular(size: 12))
        
        opponentNickLabel.font = UIFont(name: "NanumSquareB", size: 12)
        opponentLevelLabel.font = UIFont(name: "NanumSquareB", size: 14)
        opponentScoreLabel.font = UIFont(name: "NanumSquareB", size: 14)
        
        startTimeLabel.setLabel(text: "00:00", color: .black, font: .nanumBold(size: 14))
        
        finishTimeLabel.setLabel(text: String(Int(maxTime/60)) + ":00", color: .black, font: .nanumBold(size: 14))

        kmLabel.setLabel(text: "킬로미터", color: .black, font: .nanumBold(size: 14))
        
        leftTimeLabel.setLabel(text: "남은시간", color: .black, font: .nanumBold(size: 14))
        
        paceLabel.setLabel(text: "페이스", color: .black, font: .nanumBold(size: 16))
        
        opponentKmLabel.setLabel(text: "0.00", color: .black, font: .italicFont(size: 70))
        
        opponentLeftTimeLabel.font = UIFont(name: "AvenirNext-BoldItalic", size: 70)
        
        opponentPaceLabel.setLabel(text: "_'__''", color: .black, font: .italicFont(size: 36))
        
        voiceLabel.setLabel(text: "음성 피드백", color: .black, font: .nanumBold(size: 18))
    }
    
    func setView() {
        
        lockButton.setBackgroundImage(UIImage(named: "iconUnlock"), for: .normal)
        lockButton.setTitle(nil, for: .normal)
        
        backBoxImage.image = UIImage(named: "runactivityWhitebox")
        runningInfoView.backgroundColor = UIColor.salmon
        runningInfoView.layer.cornerRadius = 12
        
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
        
        let inputLevel = UserDefaults.standard.integer(forKey: "opponentLevel")
        let inputNick = UserDefaults.standard.string(forKey: "opponentNick")
        let inputWin = UserDefaults.standard.integer(forKey: "opponentWin")
        let inputLose = UserDefaults.standard.integer(forKey: "opponentLose")
        let inputImage = UserDefaults.standard.integer(forKey: "opponentImg")
        
        let profileImageStruct = ["iconRedmanShorthair","iconBluemanShorthair","iconRedmanBasichair","iconBluemanPermhair","iconRedwomenPonytail","iconBluewomenPonytail","iconRedwomenShortmhair","iconBluewomenPermhair","iconRedwomenBunnowMeterhair"]
        
        opponentImage.image = UIImage(named: profileImageStruct[(inputImage) - 1])
        opponentNickLabel.text = inputNick
        opponentScoreLabel.text = "\(inputWin)승 \(inputLose)패"
        
        let levelStruct = ["초급","중급","고급"]
        
        opponentLevelLabel.text = levelStruct[(inputLevel) - 1]
        
    }
    
    @objc func runProgressbar() {
        
        if moveTime < maxTime {
            // 아직 시간이 남아 있다면?
            moveTime = moveTime + 1.0
            // 경과 시간 + 1초
            runProgressBar.progress = moveTime/maxTime
            // 프로그래스바 다시 설정
            perform(#selector(runProgressbar), with: nil, afterDelay: 1.0)
            // 1초 후에 다시 함수 실행
            
        } else {
            
            moveTime = 0.0
            // 초기화
            
            if let distance = distance {
                // 뛴 값이 있다면
                move = Int(distance)
            } else {
                // 뛰지 않았다면?
                move = 1
            }
            
            UserDefaults.standard.set(move, forKey: "opponetDistance")
            
            FindRunnerVC.socket.emit("endRunning", UserDefaults.standard.string(forKey: "opponentRoom") ?? " ",UserDefaults.standard.integer(forKey: "opponetDistance"))

        }
    }
    
    func userElapsedTimeCount(sec: Int) {
        // 러닝 경과 시간 표시를 위한 함수
        
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
        
        if moveTime < maxTime {
            // 아직 종료 시간이 남았다면?
            perform(#selector(userElapsedTime), with: nil, afterDelay: 1.0)
            // 1초 딜레이 이후 실행
        }
        
    }
    
    @objc func userElapsedTime() {
        // 1초마다 시간이 흐르게 해주는 함수
        
        userElapsedTimeCount(sec: limitTime)
        // 러닝 경과 시간 표시 함수 실행
        limitTime = limitTime - 1
        // 남은 시간에서 1초 빼주기(1초 경과)
        
    }
    
    @objc func setMap() {
        // 네이버 맵 지도 설정
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let coor = locationManager.location?.coordinate
        let latiutd = (coor?.latitude) ?? 0.00
        let longitud = (coor?.longitude) ?? 0.00
        
        let mapView = NMFMapView(frame: naverView.bounds)
        naverView.addSubview(mapView)
        mapView.positionMode = .direction
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: latiutd, lng: longitud))
        cameraUpdate.animation = .easeIn
        cameraUpdate.animationDuration = 1
        mapView.moveCamera(cameraUpdate)
        
        
    }
    
    
}


