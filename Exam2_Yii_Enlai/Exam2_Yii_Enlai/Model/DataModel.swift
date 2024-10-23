//
//  DataModel.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import Foundation

// For https://dog.ceo/api/breeds/list/all
struct BreedsResponse: Codable {
    var message: [String: [String]]
    var status: String
}

// For https://dog.ceo/api/breed/hound/images
struct BreedImagesResponse: Codable {
    var message: [String]
    var status: String
}
