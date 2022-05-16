//
//  TestDataHelper.swift
//  BoltechTaskTests
//
//  Created by Vishal Kumar on 16/05/22.
//

import Foundation


struct TestDataHelper {
    
    static func getAllDeviceResponse() -> Data? {
        let responseString = """
                               { "items": [ { "principalId": "119b492c-1305-4182-9dcb-a6652fcf22e4", "fullName": "Jack Doe", "email": "user@gmail.com", "countryCode": "PH", "partnerId": "PLDT", "devices": [ { "id": "62009386e71c4900092710bb", "deviceType": "ROUTER", "make": "Samsung", "model": "Archer C9", "name": "Test router", "purchaseDate": null, "warrantyPeriod": 12, "extendedWarrantyPeriod": null, "purchasePrice": null, "currency": "PHP", "receiptId": null, "manuallyAddedDevice": true, "totalDeviceWarranty": 0, "warrantyExpiryDate": null, "offers": [], "deviceStatus": "Finish setup", "orders": [] }, { "id": "6200c1bae929cc0009ad991f", "deviceType": "SURVEILLANCE_CAMERA", "make": "Hikvision", "model": "2 Megapixel CMOS Vandal-proof Network Dome Camera", "name": "Hikvision IP camera", "purchaseDate": null, "warrantyPeriod": 12, "extendedWarrantyPeriod": null, "purchasePrice": null, "currency": "PHP", "receiptId": null, "manuallyAddedDevice": true, "totalDeviceWarranty": 0, "warrantyExpiryDate": null, "offers": [], "deviceStatus": "Finish setup", "orders": [] } ], "activePartnerSubsciption": true, "findDevicesContent": { "findDevices": { "isToShowPopup": true, "popupHeader": "Before we begin", "popupDescription": "Lorem ipsum dolor sit amet, consectetur adipiscing elit", "popupCTA": "OK" }, "addDeviceManually": { "isToShowPopup": true, "popupHeader": "Important notice", "popupDescription": "Lorem ipsum dolor sit amet, consectetur adipiscing elit ", "popupCTA": "OK" } } } ] }
                """
        
        
        let mockJSONData = responseString.data(using: .utf8)
        return mockJSONData
    }
}
