//
//  DogAPI.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import Foundation

class DogAPI {
    
    // Fetch the list of all breeds
    func loadBreeds() async throws -> BreedsResponse {
        guard let url = URL(string: "https://dog.ceo/api/breeds/list/all") else {
            fatalError("Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let breedsResponse = try JSONDecoder().decode(BreedsResponse.self, from: data)
        return breedsResponse
    }
    
    // Fetch images for a specific breed
    func loadBreedImages(breed: String) async throws -> BreedImagesResponse {
        let breedURL = "https://dog.ceo/api/breed/\(breed)/images"
        
        guard let url = URL(string: breedURL) else {
            fatalError("Invalid URL")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let imagesResponse = try JSONDecoder().decode(BreedImagesResponse.self, from: data)
            return imagesResponse
        } catch {
            print("Failed to decode images: \(error.localizedDescription)")
            throw error
        }
    }
}
