//
//  MyDeviceCoordinator.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 15/05/22.
//

import Foundation
import UIKit

public class MyDeviceCoordinator {

    let rootViewController: UINavigationController
    let bearerToken: String

    
    public init(navigationController: UINavigationController, bearerToken: String) {
        AppHeader.sharedInstance.setToken(token: bearerToken)
        self.rootViewController = navigationController
        self.bearerToken = bearerToken
    }

    public func start() {
        let deviceController = MyDevicesViewController()
        rootViewController.pushViewController(deviceController, animated: true)
    }
    
}
