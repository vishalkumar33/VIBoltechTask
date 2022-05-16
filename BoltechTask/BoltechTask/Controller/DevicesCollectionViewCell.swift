//
//  DevicesCollectionViewCell.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 14/05/22.
//

import UIKit

class DevicesCollectionViewCell: UICollectionViewCell {
    static let identifier = "DevicesCollectionViewCell"
    
    let imageView: UIImageView = {
        let imgView = UIImageView()
        let bundle = Bundle(identifier: "vishal.BoltechTask")
        if let path = bundle?.path(forResource: "sampleIcon", ofType: "png") {
            imgView.image = UIImage(contentsOfFile: path)
        }
        imgView.contentMode = .center
        imgView.layer.cornerRadius = 4.0
        imgView.clipsToBounds = true
        return imgView
    }()

    let labelName: UILabel = {
       let label = UILabel()
        label.text = "MacBook Pro"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.9
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let labelDesc: UILabel = {
       let label = UILabel()
        label.text = "2 Megapixel CMOS Vandal-proof Network Dome Camera "
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.9
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.imageView, self.labelName, self.labelDesc])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.backgroundColor = .white
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        handleConstraints()
        
    }
    
    func handleConstraints() {

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(verticalStackView)

        verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(device: Devices) {
        self.labelName.text = device.name
        self.labelDesc.text = device.make
    }
}
