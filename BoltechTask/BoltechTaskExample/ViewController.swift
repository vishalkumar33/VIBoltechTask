//
//  ViewController.swift
//  BoltechTaskExample
//
//  Created by Vishal Kumar on 14/05/22.
//

import UIKit
import BoltechTask

class ViewController: UIViewController {

    
    let token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IkVPVjVIQUM1OXZHYm14RC1WUG9LYSJ9.eyJpc3MiOiJodHRwczovL2Rldi15dDB0amgtci51cy5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjI4MzYzNmQ5OTBiNWIwMDY4ZWM5NTU2IiwiYXVkIjpbImh0dHBzOi8vYXV0aDAtYXBpLmNvbSIsImh0dHBzOi8vZGV2LXl0MHRqaC1yLnVzLmF1dGgwLmNvbS91c2VyaW5mbyJdLCJpYXQiOjE2NTI4NjE2ODAsImV4cCI6MTY1Mjk0ODA4MCwiYXpwIjoiclllcnBJRnl4YnIzZUc3a3JkcTRodkF4YlFBVmRSY1oiLCJzY29wZSI6Im9wZW5pZCBwcm9maWxlIGVtYWlsIiwicGVybWlzc2lvbnMiOltdfQ.N_v6Sbit-ekVLD8wlavrj45uPlhpEKgBPe6Blaza2rH1yIEi4ATqsaEOnAyAGJyrjwWMWvQwSNFRw8KTPcKs7vbVePawv0d5aqlK0ZGHVx0F28qzKdDfPQAVXyHjbDsVxSYgR3mG1n_6aHvkwwxt_z0lyRP6ZDMMQiMA6JWR0uoGF9jACftKK2PCtpaRYajABle62SVbTOzqc2dC0w78vCjMHiQKxf3JqAgiBojSrfK8y5lp4G6s1A7nRTvKQwQs5YJFtcucmoZzKuqDgakyvkBU5LGnSO0zeRBQOiiwuX8xOfOlyKBPz_xamGHmDGL560reA6SIZmOdCLwuGaz57w"
    
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
            let coordinator = MyDeviceCoordinator(navigationController: navigationController, bearerToken: token)
            coordinator.start()
        }
    }
}

