//
//  BadgeDetailData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/18.
//  Copyright © 2020 김민희. All rights reserved.
//


import Foundation
struct BadgeDetailData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: BadgeDail
}

struct BadgeDail: Codable {
    let title, content, littleContent, option: String
}
