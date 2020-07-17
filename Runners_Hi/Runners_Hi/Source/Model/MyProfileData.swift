//
//  MyProfileData.swift
//  Runners_Hi
//
//  Created by 최영재 on 2020/07/17.
//  Copyright © 2020 김민희. All rights reserved.
//
import Foundation


struct MyProfile: Codable {
    let status: Int
    let success: Bool
    let message: String
    let result: ProfileData
}

struct ProfileData: Codable {
    let nickname: String
    let gender, level, image: Int
    let badge: [Bool]
    let win, lose: Int
}
