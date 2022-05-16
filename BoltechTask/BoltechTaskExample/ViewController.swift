//
//  ViewController.swift
//  BoltechTaskExample
//
//  Created by Vishal Kumar on 14/05/22.
//

import UIKit
import BoltechTask

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupNavBar()
    }
    
    func setupNavBar() {
        navigationItem.title = "Welcome"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white]

        navBarAppearance.largeTitleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white]

        navBarAppearance.backgroundColor = UIColor(displayP3Red: 47/255,
        green: 54/255, blue: 64/255, alpha: 1.0)

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white

        navigationController?.navigationBar.standardAppearance = navBarAppearance

        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }

    @IBAction func moveToSDK(_ sender: Any) {
        if let navigationController = self.navigationController {
            let coordinator = MyDeviceCoordinator(navigationController: navigationController, bearerToken: "")
            coordinator.start()
        }
    }
}

