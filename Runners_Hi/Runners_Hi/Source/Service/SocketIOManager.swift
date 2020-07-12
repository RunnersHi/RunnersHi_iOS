//
//  SocketIOManager.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import UIKit
import SocketIO
//var manager = SocketManager(socketURL: URL(string: "13.125.20.117:3000")!, config: [.log(true), .compress])
class SocketIOManager: NSObject {
    
    static let shared = SocketIOManager()
    
    var manager = SocketManager(socketURL: URL(string: "http://13.125.20.117:3000")!, config: [.log(true), .compress])
    //    override init() {
//        super.init()
//        socket = self.manager.socket(forNamespace: "")
//        socket.on("roomFull") { dataArray, ack in
//            print("조건에 맞는 방 찾음")
//        }
    
    func establishConnection() {
        let socket = manager.socket(forNamespace: "/matching")
        socket.connect()
        socket.on("start", callback: { (data, ack) in
            socket.emit("joinRoom",["eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InRlc3QiLCJwYXNzd29yZCI6InRlc3QiLCJ0b2tlbiI6InRva2VuIiwiaWF0IjoxNTk0Mjk4Nzc0LCJleHAiOjE1OTQzMzQ3NzR9.iTbn8pV-DJ5xZC9oqXaArHi5tMq6uT7ECUuKOwTYrLU",10,1,10])
        })
       
        
    }
    func closeConnection() {
       //socket.disconnect()
    }
    func sendMessage(token: String, time: Int, wantGender: Int, leftTime: Int) {
        let socket = manager.defaultSocket
        socket.emit("joinRoom",["token": token,"time": time,"wantGender": wantGender,"leftTime": leftTime])
    }
    func startSocket() {
        let socket = manager.socket(forNamespace: "/matching")
        socket.on("start", callback: { (data, ack) in
            print("시작이요")
        })
    }
}

