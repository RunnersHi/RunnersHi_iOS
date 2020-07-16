//
//  RankingData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/16.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation

struct RankingData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: [Monthly]
}

struct Monthly: Codable {
    let nickname: String
    let image, userIdx, distanceSum: Int

    enum CodingKeys: String, CodingKey {
        case nickname, image
        case userIdx = "user_idx"
        case distanceSum = "distance_sum"
    }
}
