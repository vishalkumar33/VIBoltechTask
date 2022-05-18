//
//  MyDeviceViewModel.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 16/05/22.
//

import Foundation

class MyDeviceViewModel {

    let networkManager: MyDeviceNetworkManager
    
    var updateWithData: ((_ devices: [Devices]) -> Void)?
    
    init(networkManager: MyDeviceNetworkManager) {
        self.networkManager = networkManager
    }

    func getAllDevices() {
        networkManager.getAllDeviceInfo { [weak self] deviceResponse, error in
            DispatchQueue.main.async {
                if let deviceResponse = deviceResponse, let devices = deviceResponse.items?.first?.devices {
                    self?.updateWithData?(devices)
                }
            }
        }
    }
}
