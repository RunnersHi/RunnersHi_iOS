//
//  APIConstants.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
struct APIConstants {
    static let baseURL = "http://13.125.20.117:3000"
    static let signupURL = APIConstants.baseURL + "/user/register"
    static let duplicateURL = APIConstants.baseURL + "/user/duplicates"
    static let loginURL = APIConstants.baseURL + "/user/login"
    
}