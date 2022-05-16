//
//  DeviceResponse.swift
//  BoltechTask
//
//  Created by Vishal Kumar on 16/05/22.
//

import Foundation

public class DeviceResponse: Codable {
    public var items: [Items]?
    private enum CodingKeys: String, CodingKey {
        case items
    }
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let items = try? container.decodeIfPresent([Items].self, forKey: .items) {
            self.items = items
        }
    }
}

public class Items: Codable {
    var principalId: String?
    var fullName: String?
    var email: String?
    var countryCode: String?
    var partnerId: String?
    var devices: [Devices]?
    var activePartnerSubsciption: Bool?
    var findDevicesContent: FindDevicesContent?
    
    private enum CodingKeys: String, CodingKey {
        case principalId
        case fullName
        case email
        case countryCode
        case partnerId
        case devices
        case activePartnerSubsciption
        case findDevicesContent
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let principalId = try? container.decodeIfPresent(String.self, forKey: .principalId) {
            self.principalId = principalId
        }
        if let fullName = try? container.decodeIfPresent(String.self, forKey: .fullName) {
            self.fullName = fullName
        }
        if let email = try? container.decodeIfPresent(String.self, forKey: .email) {
            self.email = email
        }
        if let countryCode = try? container.decodeIfPresent(String.self, forKey: .countryCode) {
            self.countryCode = countryCode
        }
        if let partnerId = try? container.decodeIfPresent(String.self, forKey: .partnerId) {
            self.partnerId = partnerId
        }
        if let devices = try? container.decodeIfPresent([Devices].self, forKey: .devices) {
            self.devices = devices
        }
        if let activePartnerSubsciption = try? container.decodeIfPresent(Bool.self, forKey: .activePartnerSubsciption) {
            self.activePartnerSubsciption = activePartnerSubsciption
        }
        if let findDevicesContent = try? container.decodeIfPresent(FindDevicesContent.self, forKey: .findDevicesContent) {
            self.findDevicesContent = findDevicesContent
        }
    }
}


public class Devices: Codable {
    var id: String?
    var deviceType: String?
    var make: String?
    var model: String?
    var name: String?
    var purchaseDate: String?
    var warrantyPeriod: Int?
    var extendedWarrantyPeriod: Int?
    var purchasePrice: Int?
    var currency: String?
    var receiptId: String?
    var manuallyAddedDevice: Bool?
    var totalDeviceWarranty: Int?
    var warrantyExpiryDate: String?
    var deviceStatus: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case deviceType
        case make
        case model
        case name
        case purchaseDate
        case warrantyPeriod
        case extendedWarrantyPeriod
        case purchasePrice
        case currency
        case receiptId
        case manuallyAddedDevice
        case totalDeviceWarranty
        case warrantyExpiryDate
        case deviceStatus
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let id = try? container.decodeIfPresent(String.self, forKey: .id) {
            self.id = id
        }
        if let deviceType = try? container.decodeIfPresent(String.self, forKey: .deviceType) {
            self.deviceType = deviceType
        }
        if let make = try? container.decodeIfPresent(String.self, forKey: .make) {
            self.make = make
        }
        if let model = try? container.decodeIfPresent(String.self, forKey: .model) {
            self.model = model
        }
        if let name = try? container.decodeIfPresent(String.self, forKey: .name) {
            self.name = name
        }
        if let purchaseDate = try? container.decodeIfPresent(String.self, forKey: .purchaseDate) {
            self.purchaseDate = purchaseDate
        }
        
        if let warrantyPeriod = try? container.decodeIfPresent(Int.self, forKey: .warrantyPeriod) {
            self.warrantyPeriod = warrantyPeriod
        }
        if let extendedWarrantyPeriod = try? container.decodeIfPresent(Int.self, forKey: .extendedWarrantyPeriod) {
            self.extendedWarrantyPeriod = extendedWarrantyPeriod
        }
        if let purchasePrice = try? container.decodeIfPresent(Int.self, forKey: .purchasePrice) {
            self.purchasePrice = purchasePrice
        }
        
        if let currency = try? container.decodeIfPresent(String.self, forKey: .currency) {
            self.currency = currency
        }
        if let receiptId = try? container.decodeIfPresent(String.self, forKey: .receiptId) {
            self.receiptId = receiptId
        }
        
        if let manuallyAddedDevice = try? container.decodeIfPresent(Bool.self, forKey: .manuallyAddedDevice) {
            self.manuallyAddedDevice = manuallyAddedDevice
        }
        
        if let totalDeviceWarranty = try? container.decodeIfPresent(Int.self, forKey: .totalDeviceWarranty) {
            self.totalDeviceWarranty = totalDeviceWarranty
        }
        
        if let warrantyExpiryDate = try? container.decodeIfPresent(String.self, forKey: .warrantyExpiryDate) {
            self.warrantyExpiryDate = warrantyExpiryDate
        }
        if let deviceStatus = try? container.decodeIfPresent(String.self, forKey: .deviceStatus) {
            self.deviceStatus = deviceStatus
        }
    }
}

public class FindDevicesContent: Codable {
    var findDevices: FindDevices?
    var addDeviceManually: FindDevices?
    
    private enum CodingKeys: String, CodingKey {
        case findDevices
        case addDeviceManually
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let findDevices = try? container.decodeIfPresent(FindDevices.self, forKey: .findDevices) {
            self.findDevices = findDevices
        }
        if let addDeviceManually = try? container.decodeIfPresent(FindDevices.self, forKey: .addDeviceManually) {
            self.addDeviceManually = addDeviceManually
        }
    }
}

public class FindDevices: Codable {
    var isToShowPopup: Bool?
    var popupHeader: String?
    var popupDescription: String?
    var popupCTA: String?
    
    private enum CodingKeys: String, CodingKey {
        case isToShowPopup
        case popupHeader
        case popupDescription
        case popupCTA
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let isToShowPopup = try? container.decodeIfPresent(Bool.self, forKey: .isToShowPopup) {
            self.isToShowPopup = isToShowPopup
        }
        if let popupHeader = try? container.decodeIfPresent(String.self, forKey: .popupHeader) {
            self.popupHeader = popupHeader
        }
        if let popupDescription = try? container.decodeIfPresent(String.self, forKey: .popupDescription) {
            self.popupDescription = popupDescription
        }
        if let popupCTA = try? container.decodeIfPresent(String.self, forKey: .popupCTA) {
            self.popupCTA = popupCTA
        }
    }
}
