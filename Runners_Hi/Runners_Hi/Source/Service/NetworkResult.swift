//
//  NetworkResult.swift
//  Runners_Hi
//
//  Created by 김민희 on 2020/07/10.
//  Copyright © 2020 김민희. All rights reserved.
//

import Foundation
enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
