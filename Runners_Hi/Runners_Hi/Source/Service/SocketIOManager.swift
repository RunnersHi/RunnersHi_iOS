//
//  SocketIOManager.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    
    static let manager = SocketManager(socketURL: URL(string: "http://13.125.20.117:3000")!, config: [.log(true), .compress])
    
    var leftTime: Int = 300
    var room: String = ""
    
    let myToken : String = (UserDefaults.standard.object(forKey: "token") as? String) ?? ""
    let myGoal : Int = (UserDefaults.standard.object(forKey: "myGoalTime") as? Int) ?? (-1)
    let myWantGender : Int = (UserDefaults.standard.object(forKey: "myWantGender") as? Int) ?? (-1)
    
    static var socket: SocketIOClient!
//
//        override init() {
//        super.init()
//        socket = SocketIOManager.manager.socket(forNamespace: "/matching")
//    }
    
    func establishConnection() {
        socket.connect()
    }
    func findRunner() {
        
        socket.on("ping", callback: { (data, ack) in
            self.socket.emit("pong",1)
        })
        socket.on("start", callback: { (data, ack) in
            self.socket.emit("joinRoom",self.myToken,self.myGoal,self.myWantGender,self.leftTime)
        })
        socket.on("roomCreated", callback: { (data, ack) in
            // 여기서 data[0]은 생성된 방 이름 (String)
            self.socket.emit("startCount",data[0] as! SocketData)
        })
        socket.on("timeLeft", callback: {(data, ack) in
            // 남은 시간은 Int 타입으로 넘겨줌
            self.leftTime = data[0] as! Int
        })
        socket.on("timeOver", callback: { (data, ack) in
            print("끊어")
            self.socket.disconnect()
        })
        socket.on("matched", callback: { (data, ack) in
            // 여기서 data[0]은 내가 속한 방 이름 (String)
            self.socket.emit("endCount",data[0] as! SocketData)
            // matched에서 받은 속한 방 이름과 함게 보내줌
        })
        socket.on("roomFull", callback: { (data, ack) in
            self.room = ((data[0] as! NSString) as String)
            self.socket.emit("opponentInfo",data[0] as! SocketData)
        })
        socket.on("opponentInfo", callback: { (data, ack) in
            //UserDefaults.standard.set(data[1] , forKey: "opponentNick")
            let yourNick: String = data[1] as? String ?? " "
            UserDefaults.standard.set(yourNick.fromBase64URL() , forKey: "opponentNick")
            UserDefaults.standard.set(data[2], forKey: "opponentLevel")
            UserDefaults.standard.set(data[3], forKey: "opponentWin")
            UserDefaults.standard.set(data[4], forKey: "opponentLose")
            UserDefaults.standard.set(data[5], forKey: "opponentImg")
            self.socket.emit("readyToRun",self.room)
            
        })
        socket.on("letsRun", callback: { (data, ack) in
            print("이제 뛰자구!")
            let runningTabStoryboard = UIStoryboard.init(name: "RunningTab", bundle: nil)
            guard let LetsRuns = runningTabStoryboard.instantiateViewController(identifier:"FindRunnerVC") as? FindRunnerVC else {return}
            guard let LetsRuns2 = runningTabStoryboard.instantiateViewController(identifier:"OpponentProfileVC") as? OpponentProfileVC else {return}

            LetsRuns.navigationController?.pushViewController(LetsRuns2, animated: true)
            //LetsRuns.checktGo()
            
        })

        socket.on("opponentNotReady", callback: { (data, ack) in
            print("조금만기다려")
        })

        socket.on("error", callback: { (data, ack) in
            print("저는 바보입니다...ㅠㅠ")
        })
   
    }
//    func kmPassed(km: Int) {
//        socket.emit("kmPassed", self.room, km)
//    }
//    func finishRun(distance: Int) {
//        socket.emit("endRunning", self.room, distance)
//    }
    func closeConnection() {
       socket.disconnect()
    }

//    func pingpong() {
//        socket.on("ping", callback: { (data, ack) in
//            self.socket.emit("pong",1)
//        })
//    }
}

