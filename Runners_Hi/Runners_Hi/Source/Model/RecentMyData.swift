//
//  RecentData.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation

struct RecentMyData<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: T
}

struct myRecent: Codable {
    let distance: Int
    let time: String
    let paceMinute, paceSecond, image, result: Int
    let createdTime: String

    enum CodingKeys: String, CodingKey {
        case distance, time
        case paceMinute = "pace_minute"
        case paceSecond = "pace_second"
        case image, result
        case createdTime = "created_time"
    }
}
struct opponentRecent: Codable {
    let nickname: String
    let distance: Int
    let time: String
    let paceMinute, paceSecond: Int

    enum CodingKeys: String, CodingKey {
        case nickname, distance, time
        case paceMinute = "pace_minute"
        case paceSecond = "pace_second"
    }
}
