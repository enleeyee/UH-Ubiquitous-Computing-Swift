//
//  FavoritesManager.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import Foundation

class FavoritesManager: ObservableObject {
    @Published var favoriteBreeds: [String] = []

    func toggleFavorite(breed: String) {
        if let index = favoriteBreeds.firstIndex(of: breed) {
            favoriteBreeds.remove(at: index) // Remove if already a favorite
        } else {
            favoriteBreeds.append(breed) // Add to favorites
        }
    }
    
    func isFavorite(breed: String) -> Bool {
        return favoriteBreeds.contains(breed)
    }
}
