//
//  Exercise8_Yii_EnlaiApp.swift
//  Exercise8_Yii_Enlai
//
//  Created by Enlai Yii on 11/8/24.
//

import SwiftUI

@main
struct Exercise8_Yii_EnlaiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifier: ImageClassifier())
        }
    }
}
