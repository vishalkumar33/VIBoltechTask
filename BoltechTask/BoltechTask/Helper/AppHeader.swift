//
//  AppHeader.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 16/05/22.
//

import Foundation

class AppHeader {
    
    var token: String?
    static let sharedInstance = AppHeader()
    
    private init() {}
    
    func setToken(token: String) {
        self.token = token
    }

    func getHeader() -> HTTPHeaders {
        guard let token = token else {
            fatalError("Invalid token")
        }
        var header = [String: String]()
        header["Authorization"] = "Bearer \(token)"
        return header
    }
    
}
