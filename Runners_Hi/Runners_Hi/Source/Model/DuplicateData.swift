//
//  DuplicateData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation

struct DuplicateData: Codable {
    var status: Int
    var success: Bool
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
