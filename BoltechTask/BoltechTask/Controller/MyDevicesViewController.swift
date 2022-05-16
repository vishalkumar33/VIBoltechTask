//
//  MyDevicesViewController.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 14/05/22.
//

import UIKit

class MyDevicesViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var viewModel: MyDeviceViewModel?
    var devices = [Devices]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Device"
        setupCollectionView()
        setupViewModel()
    }
    
    func setupCollectionView() {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 47/255,
                                       green: 54/255,
                                       blue: 64/255,
                                       alpha: 1.0)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 16, y: 16, width: self.view.frame.width - 32, height: self.view.frame.height - 32), collectionViewLayout: layout)
        collectionView.register(DevicesCollectionViewCell.self,
                                forCellWithReuseIdentifier: DevicesCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(displayP3Red: 47/255,
                                                 green: 54/255,
                                                 blue: 64/255,
                                                 alpha: 1.0)
        collectionView.showsVerticalScrollIndicator = false
        
        
        
        view.addSubview(collectionView)
        
        self.view = view
    }
    
    func setupViewModel() {
        let networkManager = MyDeviceNetworkManager(router: Router())
        viewModel = MyDeviceViewModel(networkManager: networkManager)
        viewModel?.getAllDevices()
        self.listener()
    }
    
    func listener() {
        self.viewModel?.updateWithData = { [weak self] devices in
            self?.devices = devices
        }
    }
    
}

extension MyDevicesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.devices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DevicesCollectionViewCell.identifier, for: indexPath) as? DevicesCollectionViewCell {
            cell.setupData(device: self.devices[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MyDevicesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

extension MyDevicesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        
        return CGSize(width: size, height: size)
    }
}
