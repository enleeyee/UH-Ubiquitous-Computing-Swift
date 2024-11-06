//
//  SelectedBreeds.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//

import SwiftUI
import Combine

class SelectedBreeds: ObservableObject {
    @Published var selectedDog: String? = nil
    @Published var selectedCat: String? = nil
}
