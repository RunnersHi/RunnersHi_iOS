//
//  FindRunnerVC.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import SocketIO


class FindRunnerVC: UIViewController {

    let maxTime: Float = 300.0
    var moveTime: Float = 0.0
    var lastGoal: Int = 0
    var lastGender: Int = 0
    var leftTime: Int = 300
    var room: String = ""
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "http://13.125.20.117:3000")!, config: [.log(true), .compress])
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var timeProgressBar: UIProgressView!

    @IBOutlet weak var mentTextView: UITextView!
    
    @IBOutlet weak var mentTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mentStopButton: UIButton!
    override func viewDidLoad() {
        // 소켓 통신 연결 시작
        super.viewDidLoad()
        startSocket()
        basicAutoLayout()
        // Do any additional setup after loading the view.
    }
    private func basicAutoLayout() {
       // mentStopButton.
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.backgroundgray
        logoImage.image = UIImage(named: "matchLogo")
        timeProgressBar.setProgress(moveTime, animated: true)
        perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
        timeProgressBar.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        timeProgressBar.layer.cornerRadius = 3
        timeProgressBar.clipsToBounds = true
        mentTextView.font = UIFont(name: "NanumSquare", size: 18)
        mentTextView.textAlignment = .center
        mentTextView.backgroundColor = UIColor.backgroundgray
        //textView 수정 불가하게 하기
        mentTextView.isEditable = false
       // mentTextViewHeight.constant = mentTextView.contentSize.height
        mentStopButton.setTitle("매칭 중단하기", for: .normal)
        mentStopButton.titleLabel?.font = UIFont(name: "NanumSquareB", size: 16)
        mentStopButton.setTitleColor(.white, for: .normal)
        mentStopButton.backgroundColor = UIColor.lightishBlue
        mentStopButton.layer.cornerRadius = 8
    }
    
    private func startSocket() {
        // 소켓 연결
        let socket = manager.socket(forNamespace: "/matching")
        socket.connect()
        
        // 서버 : 시작해도 좋다는 응답 -> 클라 : 내 정보와 내가 원하는 상대의 조건을 보내줌
        socket.on("start", callback: { (data, ack) in
            socket.emit("joinRoom","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InRlc3R0ZXN0NSIsInBhc3N3b3JkIjoidGVzdHRlc3Q1IiwidG9rZW4iOiJ0b2tlbiIsImlhdCI6MTU5NDU3Mjc1MCwiZXhwIjoxNTk0NjA4NzUwfQ.DUP6jOcCEKDzKIXm9QknGPbPoHctHhJgT2ok_OGVVf4",self.lastGoal,self.lastGender,self.leftTime)
        })
        
        // 내가 원하는 조건의 상대를 찾지 못해서
        // 서버 : 새로운 방을 만들어서 나를 넣어줌 -> 클라 : 시간 카운트를 하라는걸 알려줌
        socket.on("roomCreated", callback: { (data, ack) in
            socket.emit("startCount",data[0] as! SocketData)
        })
        // 클라 : 남은 시간을 나에게 보내줌
        socket.on("timeLeft", callback: {(data, ack) in
            self.leftTime = data[0] as! Int
        })
        // 매칭 시간이 다 지났지만, 매칭 상대를 찾지 못했을때
        // 서버 : 시간이 다 됐다고 알려줌 -> 클라 : 소켓 통신 끊기
        socket.on("timeOver", callback: { (data, ack) in
            print("끊어")
            socket.disconnect()
        })
        
        socket.on("matched", callback: { (data, ack) in
            
            socket.emit("endCount",data[0] as! SocketData)
        })
        socket.on("roomFull", callback: { (data, ack) in
            self.room = ((data[0] as! NSString) as String)
            socket.emit("opponentInfo",data[0] as! SocketData)
        })
        socket.on("opponentInfo", callback: { (data, ack) in
            UserDefaults.standard.set(data[1] , forKey: "opponentNick")
            UserDefaults.standard.set(data[2], forKey: "opponentLevel")
            UserDefaults.standard.set(data[3], forKey: "opponentWin")
            UserDefaults.standard.set(data[4], forKey: "opponentLose")
            UserDefaults.standard.set(data[5], forKey: "opponentImg")
            socket.emit("readyToRun",self.room)
            
        })
        socket.on("letsRun", callback: { (data, ack) in
            print("이제 뛰자")
            guard let LetsRun = self.storyboard?.instantiateViewController(identifier:"CountdownVC") as? CountdownVC else {return}
            self.navigationController?.pushViewController(LetsRun, animated: true)
        })
        socket.on("opponentNotReady", callback: { (data, ack) in
            print("조금만기다려")
        })

        socket.on("error", callback: { (data, ack) in
            print("저는 바보입니다...ㅠㅠ")
        })
    }
    
    @objc func updateProgressbar() {
        moveTime = moveTime + 1.0
        timeProgressBar.progress = moveTime/maxTime
        if moveTime < maxTime {
            perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
        } else {
            print("끝")
            moveTime = 0.0
        }
    }

}
