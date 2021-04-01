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

    // MARK: Variable Part
    
    let waitMaxTime: Float = 300.0
    // 대기 최대 시간
    var nowWaitTime: Float = 0.0
    // 현재 내 대기 시간
    var leftTime: Int = 300
    var room: String = ""
    
    static var manager = SocketManager(socketURL: URL(string: "http://13.125.20.117:3000")!, config: [.log(true), .compress])
    // 소켓통신에 필요한 주소 입력
    
    static var socket: SocketIOClient!

    // MARK: IBOutlet
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var timeProgressBar: UIProgressView!

    @IBOutlet weak var mentTextView: UITextView!
    
    @IBOutlet weak var mentTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mentStopButton: UIButton!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        connetSocket()
        setView()
        setText()
    }

}

// MARK: Extension

extension FindRunnerVC {
    
    // MARK: Function View Style
    
    func setView() {
        
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.backgroundgray
        logoImage.image = UIImage(named: "matchLogo")
        
        timeProgressBar.setProgress(nowWaitTime, animated: true)
        // progressBar 시작 시간 셋팅
        perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
        // 1초마다 progressbar 가 증가하도록 실행
        
        timeProgressBar.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        timeProgressBar.layer.cornerRadius = 3
        timeProgressBar.clipsToBounds = true
        
        mentTextView.backgroundColor = UIColor.backgroundgray
        
        //textView 수정 불가하게 하기
        mentTextView.isEditable = false
    
        mentStopButton.layer.cornerRadius = 8
        
    }
    
    // MARK: Function Text Style
    
    func setText() {
        
        mentTextView.font = .nanumRegular(size: 18)
        mentTextView.textAlignment = .center
        
        mentStopButton.setTitle("매칭 중단하기", for: .normal)
        mentStopButton.titleLabel?.font = .nanumBold(size: 16)
        mentStopButton.setTitleColor(.white, for: .normal)
        mentStopButton.backgroundColor = UIColor.lightishBlue
        
    }
    
    @objc func updateProgressbar() {
        
        nowWaitTime = nowWaitTime + 1.0
        // 계속 1초씩 더해줌
        
        timeProgressBar.progress = nowWaitTime/waitMaxTime
        
        if nowWaitTime < waitMaxTime {
            // 아직 maxTime이 되지 않았다면
            perform(#selector(updateProgressbar), with: nil, afterDelay: 1.0)
            // 1초후에 다시 실행
            
        } else {
            // 시간이 다 됐다면
            nowWaitTime = 0.0
            // 시간 변수 초기화
        }
    }
}

extension FindRunnerVC {
    
    // MARK: Socket
    
    func connetSocket() {
        
        FindRunnerVC.socket = FindRunnerVC.self.manager.socket(forNamespace: "/matching")
        // Socket 통신에서 matching이라는 Room을 만들어서 사용
        FindRunnerVC.socket.connect()
        // 설정한 주소와 포트로 소켓 연결시도
        pingpong()
        startSocket()
    }
    
    func pingpong() {
        // 이벤트가 없을 때 ping timeout으로 소켓 통신이 끊기는 것을 방지하고자 9초 간격으로 클라이언트와 서버가 ping pong을 주고받음
        
        FindRunnerVC.socket.on("ping", callback: { (data, ack) in
            // "ping" 이라는 이벤트를 서버에서 받음
            FindRunnerVC.self.socket.emit("pong",1)
            // 받았다면 "pong"이라는 이벤트 이름의 1 값을 서버에 보내줌
            
        })
    }
    
    func startSocket() {
        
        // UserDefaults에서 매칭 정보를 가져옴
        let myToken : String = (UserDefaults.standard.object(forKey: "token") as? String) ?? ""
        let myGoal : Int = (UserDefaults.standard.object(forKey: "myGoalTime") as? Int) ?? (-1)
        let myWantGender : Int = (UserDefaults.standard.object(forKey: "myWantGender") as? Int) ?? (-1)

        // 서버 : 시작해도 좋다는 응답 -> 클라 : 내 정보와 내가 원하는 상대의 조건을 보내줌
        FindRunnerVC.socket.on("start", callback: { (data, ack) in
            // "start"라는 이름의 event를 서버에서 받는다면 소켓 통신이 연결 되었다는 뜻!
            FindRunnerVC.self.socket.emit("joinRoom",myToken,myGoal,myWantGender,self.leftTime)
            // "joinRoom"이라는 이벤트로 토큰, 원하는 목표 시간, 원하는 상대방 성별, 현재 남은 시간을 송신
        })

        // 서버 : 새로운 방을 만들어서 나를 넣어줌 -> 클라 : 시간 카운트를 하라는걸 알려줌
        FindRunnerVC.socket.on("roomCreated", callback: { (data, ack) in
            // "roomCreated"라는 이름의 event를 서버에서 받는다면 내가 원하는 조건의 상대가 현재 대기방에 존재하지 않아 내가 방을 만들어야 한다는 뜻
            // 서버가 data로 내가 생성할 방 넘버를 보내줌
            FindRunnerVC.self.socket.emit("startCount",data[0] as! SocketData)
            // "startCount"라는 이벤트로 대기 방 생성 ( 매칭 대기 시간 시작 )
        })
        
        // 클라 : 남은 시간을 나에게 보내줌
        FindRunnerVC.socket.on("timeLeft", callback: {(data, ack) in
            // "timeLeft"라는 이름의 event를 서버에서 받는다면 매칭 대기중 이라는 뜻
            // 서버가 3초마다 data로 매칭에 남은 시간을 보내줌
            self.leftTime = data[0] as! Int
            // 매칭 남은 시간을 저장해둔다
        })
        
        // 서버 : 시간이 다 됐다고 알려줌 -> 클라 : 소켓 통신 끊기
        FindRunnerVC.socket.on("timeOver", callback: { (data, ack) in
            // "timeOver"라는 이름의 event를 서버에서 받는다면 매칭 시간이 다 지났고, 매칭 상대를 찾지 못했다는 뜻
            FindRunnerVC.self.socket.disconnect()
            // 소켓통신 중지
        })

        // 대기 중 상대를 찾았을때
        FindRunnerVC.socket.on("matched", callback: { (data, ack) in
            // "matched"라는 이름의 event를 서버에서 받는다면 매칭에 성공했다는 뜻
            // 서버가 data로 내가 들어간 방의 이름을 보내줌
            FindRunnerVC.self.socket.emit("endCount",data[0] as! SocketData)
            // "endCount"라는 이벤트로 내가 들어간 방 이름과 함께 송신
        })
        
        FindRunnerVC.socket.on("roomFull", callback: { (data, ack) in
            // "roomFull"이라는 이름의 evnet를 서버에서 받는다면 방이 다 찼다는 뜻
            // 이 뜻은 내가 누군가에 방에 들어갔거나, 내 방에 누군가가 들어왔다는 뜻임
            self.room = ((data[0] as! NSString) as String)
            // 서버가 data로 방 이름을 보내줌
            FindRunnerVC.self.socket.emit("opponentInfo",data[0] as! SocketData)
            // "opponentinfo"라는 이벤트로 방 이름과 함께 송신 -> 상대방 정보 요청
        })
        
        FindRunnerVC.socket.on("opponentInfo", callback: { (data, ack) in
            // "opponentInfo" 이라는 이름의 event를 서버에서 받는다면 상대방 정보가 도착했다는 뜻
            
            // 이후의 뷰에서도 계속 사용하는 정보이기 때문에 UserDefaults로 저장해둠
            UserDefaults.standard.set(data[0] , forKey: "opponentRoom")
            // 매칭에 속한 방 이름
            let yourNick: String = data[1] as? String ?? " "
            UserDefaults.standard.set(yourNick.fromBase64URL() , forKey: "opponentNick")
            // 상대방 닉네임
            UserDefaults.standard.set(data[2], forKey: "opponentLevel")
            //상대방 유저 레벨(초급 1, 중급 2, 고급 3)
            UserDefaults.standard.set(data[3], forKey: "opponentWin")
            // 상대방 유저 승리 횟수
            UserDefaults.standard.set(data[4], forKey: "opponentLose")
            // 상대방 유저 패배 횟수
            UserDefaults.standard.set(data[5], forKey: "opponentImg")
            // 프로필 이미지 번호
            FindRunnerVC.self.socket.emit("readyToRun",self.room)
            // "readyToRun"라는 이벤트 송신 -> 준비 완료

        })
        
        FindRunnerVC.socket.on("letsRun", callback: { (data, ack) in
            // "letsRun" 이라는 이름의 event를 서버에서 받는다면 둘 다 준비가 완료되었고, 이제 러닝을 시작한다는 뜻
            
            guard let LetsRun = self.storyboard?.instantiateViewController(identifier:"OpponentProfileVC") as? OpponentProfileVC else {return}
            self.navigationController?.pushViewController(LetsRun, animated: true)
            // 다음 뷰로 이동
        })
        
        FindRunnerVC.socket.on("opponentNotReady", callback: { (data, ack) in
            // "opponentNotReady" 이라는 이름의 event를 서버에서 받는다면 아직 상대방이 매칭 준비가 되지 않았다는 뜻 -> 서버에 "readyToRun"라는 이벤트를 송신하지 않았다
            print("wait plz:")
        })

        FindRunnerVC.socket.on("error", callback: { (data, ack) in
            // "error" 이라는 이름의 event를 서버에서 받는다면 소켓 통신에 에러가 생겼다는 의미
            print("error 발생")
        })

    }
}
