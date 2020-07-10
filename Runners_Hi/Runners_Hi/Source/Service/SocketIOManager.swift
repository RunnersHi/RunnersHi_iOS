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
        let socket = manager.defaultSocket

        socket.connect()
    }
    func closeConnection() {
       //socket.disconnect()
    }
    func sendMessage(token: String, time: Int, wantGender: Int, left_time: Int) {
       /// socket.emit("joinRoom",["token": token,"time": time,"wantGender": wantGender,"left_time": left_time])
    }
}

