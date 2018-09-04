//
//  ResponseModels.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 02.03.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation

struct RegisterResponse: Codable {
    let status: String
    let token: String
}
