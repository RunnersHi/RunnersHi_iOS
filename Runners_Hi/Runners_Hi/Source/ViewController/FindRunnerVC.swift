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
    var leftTime: Int = 300
    var room: String = ""
    static let shared = SocketIOManager()
    var manager = SocketManager(socketURL: URL(string: "http://13.125.20.117:3001")!, config: [.log(true), .compress])
    
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
        
        // UserDefaults에서 매칭 정보를 가져옴
        let myToken : String = (UserDefaults.standard.object(forKey: "token") as? String) ?? ""
        let myGoal : Int = (UserDefaults.standard.object(forKey: "myGoalTime") as? Int) ?? (-1)
        let myWantGender : Int = (UserDefaults.standard.object(forKey: "myWantGender") as? Int) ?? (-1)
        
        // 서버 : 시작해도 좋다는 응답 -> 클라 : 내 정보와 내가 원하는 상대의 조건을 보내줌
        socket.on("start", callback: { (data, ack) in
            socket.emit("joinRoom",myToken,myGoal,myWantGender,self.leftTime)
        })
        
        // 내가 원하는 조건의 상대를 찾지 못해서
        // 서버 : 새로운 방을 만들어서 나를 넣어줌 -> 클라 : 시간 카운트를 하라는걸 알려줌
        socket.on("roomCreated", callback: { (data, ack) in
            // 여기서 data[0]은 생성된 방 이름 (String)
            socket.emit("startCount",data[0] as! SocketData)
        })
        // 클라 : 남은 시간을 나에게 보내줌
        socket.on("timeLeft", callback: {(data, ack) in
            // 남은 시간은 Int 타입으로 넘겨줌
            self.leftTime = data[0] as! Int
        })
        // 매칭 시간이 다 지났지만, 매칭 상대를 찾지 못했을때
        // 서버 : 시간이 다 됐다고 알려줌 -> 클라 : 소켓 통신 끊기
        socket.on("timeOver", callback: { (data, ack) in
            print("끊어")
            socket.disconnect()
        })
        
        // 대기 중 상대를 찾았을때
        socket.on("matched", callback: { (data, ack) in
            // 여기서 data[0]은 내가 속한 방 이름 (String)
            socket.emit("endCount",data[0] as! SocketData)
            // matched에서 받은 속한 방 이름과 함게 보내줌
        })
        // 방이 다 찼을때
        socket.on("roomFull", callback: { (data, ack) in
            self.room = ((data[0] as! NSString) as String)
            socket.emit("opponentInfo",data[0] as! SocketData)
        })
        socket.on("opponentInfo", callback: { (data, ack) in
            //UserDefaults.standard.set(data[1] , forKey: "opponentNick")
            let yourNick: String = data[1] as? String ?? " "
            UserDefaults.standard.set(yourNick.fromBase64URL() , forKey: "opponentNick")
            UserDefaults.standard.set(data[2], forKey: "opponentLevel")
            UserDefaults.standard.set(data[3], forKey: "opponentWin")
            UserDefaults.standard.set(data[4], forKey: "opponentLose")
            UserDefaults.standard.set(data[5], forKey: "opponentImg")
            socket.emit("readyToRun",self.room)
            
        })
        socket.on("letsRun", callback: { (data, ack) in
            print("이제 뛰자")
            guard let LetsRun = self.storyboard?.instantiateViewController(identifier:"OpponentProfileVC") as? OpponentProfileVC else {return}
            self.navigationController?.pushViewController(LetsRun, animated: true)
        })
        socket.on("opponentNotReady", callback: { (data, ack) in
            print("조금만기다려")
        })

        socket.on("error", callback: { (data, ack) in
            print("저는 바보입니다...ㅠㅠ")
        })
    }
    struct NickName : Codable {
        var nick : String
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
extension String {
    func fromBase64URL() -> String? {
        var base64 = self
        base64 = base64.replacingOccurrences(of: "-", with: "+")
        base64 = base64.replacingOccurrences(of: "_", with: "/")
        while base64.count % 4 != 0 {
            base64 = base64.appending("=")
        }
        guard let data = Data(base64Encoded: base64) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64URL() -> String {
        var result = Data(self.utf8).base64EncodedString()
        result = result.replacingOccurrences(of: "+", with: "-")
        result = result.replacingOccurrences(of: "/", with: "_")
        result = result.replacingOccurrences(of: "=", with: "")
        return result
    }
}

