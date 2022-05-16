//
//  MyDeviceNetworkManager.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 14/05/22.
//

import Foundation

class MyDeviceNetworkManager {
    
    var router: NetworkRouter
    
    init(router: NetworkRouter) {
        self.router = router
    }
    
    func getAllDeviceInfo(completion: @escaping(_ deviceResponse: DeviceResponse?, _ error: String?) -> Void) {
        router.request(MyDeviceAPI.getAllDevices) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = NetworkManager.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    let res = Parser.decodeResponse(DeviceResponse.self, from: responseData)
                    if let res = res.0  {
                        completion(res, nil)
                    } else {
                        completion(nil, NetworkResponse.noData.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
}
