//
//  RecordAllData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//
import Foundation

struct RecordAllData<T: Codable> : Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [T]
}

struct Result: Codable {
    let date: String
    let distance, time, runIdx, result: Int
    let gameIdx: Int
    
    enum CodingKeys: String, CodingKey {
        case date, distance, time
        case runIdx = "run_idx"
        case result
        case gameIdx = "game_idx"
    }
}

struct RecordAllData2 : Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: BadgeResult
}
struct BadgeResult: Codable {
    let badge: [Bool]
}

