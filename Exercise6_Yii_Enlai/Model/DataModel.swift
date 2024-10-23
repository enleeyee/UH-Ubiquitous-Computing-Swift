//
//  DataModel.swift
//  Exercise6_Yii_Enlai
//
//  Created by Enlai Yii on 10/11/24.
//

import Foundation
import CoreLocation

struct TransactionData: Codable {
    let transactions: [Transactions]
}

struct Transactions: Codable {
    let date: String
    var entries: [Entry]
}

struct Entry: Codable {
    let logo: URL
    let title: String
    let amount: String
    let type: String
    let description: String
    let merchant_type: String
    let method: String
    let address: String
    let cap_lat: Double
    let cap_long: Double
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: cap_lat, longitude: cap_long)
    }
    let phone: String
}
