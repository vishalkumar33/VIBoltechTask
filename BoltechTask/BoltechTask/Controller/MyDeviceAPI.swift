//
//  MyDeviceAPI.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 14/05/22.
//

import Foundation

enum MyDeviceAPI {
    case getUserInfo
    case getAllDevices
}

extension MyDeviceAPI: EndPointType {
    
    var baseURL: URL {
        switch self {
        case .getUserInfo:
            guard let url = URL(string: BaseURLConstant.BASE_URL_OF_USER_INFO) else {
                fatalError("baseURL could not be configured.")
            }
            return url
        case .getAllDevices:
            guard let url = URL(string:  BaseURLConstant.BASE_URL_OF_USER_DEVICE) else {
                fatalError("baseURL could not be configured.")
            }
            return url
        }
    }
    
    var path: String {
        switch self {
        case .getUserInfo: return PathConstant.getUserInfo
        case .getAllDevices: return PathConstant.getUserDeviceInfo
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }

    var headers: HTTPHeaders? {
        return AppHeader.sharedInstance.getHeader()
    }
}
