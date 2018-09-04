//
//  GenDefs.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 28.01.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.pi-company.com"

// MARK: - User info type

enum UserInfoType {
    case help
    case privacyPolicy
}

enum UserDefaultsKeys: String {
    case test = "test"
}

let StarSoundElements : [String] = ["Mountain peak","Sea shore","Morning rain","Night sound","Train sounds"]
