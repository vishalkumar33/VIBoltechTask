//
//  NetworkConstant.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 15/05/22.
//

import Foundation

struct BaseURLConstant {
    static let BASE_URL_OF_USER_INFO = "https://dev-yt0tjh-r.us.auth0.com"
    static let BASE_URL_OF_USER_DEVICE = "https://xt12p902nb.execute-api.ap-southeast-1.amazonaws.com"
}

/// Path Constant
struct PathConstant {
    static let getUserInfo = "/userinfo"
    static let getUserDeviceInfo = "/dev/v1/users"
}
