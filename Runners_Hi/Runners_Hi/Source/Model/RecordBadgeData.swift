//
//  RecordBadgeData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation

struct RecordBadgeData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: Result
}

struct Result: Codable {
    let badge: [Bool]
}
