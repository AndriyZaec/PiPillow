//
//  PiPillowAPIService.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 01.03.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum PiPillowAPIService {
    case register(email: String, password: String, name: String)
    case login(email: String, password: String)
}

extension PiPillowAPIService: TargetType {
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/user/login"
        case .register:
            return "/user/register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .login(let email, let password):
            return "{ \"email\": \"\(email)\", \"password\": \"\(password)\" }".utf8Encoded
        case .register(let email, let password, let name):
            return "{ \"email\": \(email), \"password\": \(password), \"name\":\(name)}".utf8Encoded
        }
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
//          return .requestParameters(parameters: ["email" : email, "password": password], encoding: JSONEncoding.default)
            
            let emailMultipart = MultipartFormData(provider: .data(email.utf8Encoded), name: "email")
            let passwordMultipart = MultipartFormData(provider: .data(password.utf8Encoded), name: "password")
            let list = [emailMultipart,passwordMultipart]
            return .uploadMultipart(list)
        case .register(let email, let password, let name):
//            return .requestParameters(parameters: ["email" : email,
//                                                   "password" : password,
//                                                   "name": name], encoding: JSONEncoding.default)
            
            let emailMultipart = MultipartFormData(provider: .data(email.utf8Encoded), name: "email")
            let nameMultipart = MultipartFormData(provider: .data(name.utf8Encoded), name: "name")
            let passwordMultipart = MultipartFormData(provider: .data(password.utf8Encoded), name: "password")
            
            let list = [emailMultipart,passwordMultipart,nameMultipart]
            
            return .uploadMultipart(list)
        }
    }
    
    var headers: [String : String]? {
         return ["Content-type": "multipart/form-data"]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
            
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

extension PiPillowAPIService {
    
    func log() {
        print("/n/n")
        print("url \(BASE_URL)\(path)")
        print("method: ",method)
        print("headers: ",headers ?? "no headers")
        print("params: ", String(data: sampleData, encoding: .utf8) ?? "no params")
        print("/n/n")
    }
    
}
