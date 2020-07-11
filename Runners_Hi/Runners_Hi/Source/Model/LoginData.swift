//
//  LoginData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/11.
//  Copyright © 2020 김민희. All rights reserved.
//

struct LoginData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var result: TokenData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case result = "result"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        result = (try? values.decode(TokenData.self, forKey: .result)) ?? nil
    }
}
struct TokenData: Codable {
    var token: String
}
