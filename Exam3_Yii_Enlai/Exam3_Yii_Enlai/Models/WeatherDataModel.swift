//
//  WeatherDataModel.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import Foundation

class WeatherDataModel: ObservableObject {
    @Published var target: String = ""
    @Published var imageName: String = ""
}
