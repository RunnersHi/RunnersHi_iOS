//
//  RecordAllData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/14.
//  Copyright © 2020 김민희. All rights reserved.
//
import Foundation

struct RecordAllData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: [Result]
}

struct Result: Codable {
    let date: String
    let distance: Int
    let time: String
    let runIdx, result, gameIdx: Int

    enum CodingKeys: String, CodingKey {
        case date, distance, time
        case runIdx = "run_idx"
        case result
        case gameIdx = "game_idx"
    }
}
