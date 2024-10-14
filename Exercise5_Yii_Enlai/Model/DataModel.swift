//
//  DataModel.swift
//  Exercise5_Yii_Enlai
//
//  Created by Enlai Yii on 10/9/24.
//

import Foundation

struct TransactionData: Codable {
    let transactions: [Transactions]
}

struct Transactions: Codable {
    let date: String
    let entries: [Entry]
}

struct Entry: Codable {
    let logo: String
    let title: String
    let amount: String
    let type: String
    let description: String
    let merchant_type: String
    let method: String
    let address: String
    let phone: String
}
