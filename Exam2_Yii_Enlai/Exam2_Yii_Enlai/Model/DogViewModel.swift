//
//  DogViewModel.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

class DogViewModel: ObservableObject {
    @Published var breeds: [String] = []
    @Published var searchText: String = ""
    private let dogAPI = DogAPI()
    
    // Load all breeds
    func loadBreeds() async {
        do {
            let response = try await dogAPI.loadBreeds()
            DispatchQueue.main.async {
                self.breeds = response.message.keys.sorted()
            }
        } catch {
            print("Failed to load breeds: \(error)")
        }
    }
    
    // Filtered breeds based on search query
    var filteredBreeds: [String] {
        if searchText.isEmpty {
            return breeds
        } else {
            return breeds.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
