//
//  DogImageViewModel.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

class BreedImageViewModel: ObservableObject {
    @Published var breedImages: [String]?
    private let breed: String
    private let dogAPI = DogAPI()
    
    init(breed: String) {
        self.breed = breed
    }
    
    func loadBreedImages() async {
        do {
            let imagesResponse = try await dogAPI.loadBreedImages(breed: breed)
            DispatchQueue.main.async {
                self.breedImages = imagesResponse.message
            }
        } catch {
            print("Failed to load breed images: \(error)")
        }
    }
}
