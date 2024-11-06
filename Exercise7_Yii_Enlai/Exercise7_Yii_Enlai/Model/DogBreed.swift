//
//  DogBreed.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//

import Foundation

struct DogBreed: Codable {
    var message: [String: [String]]
    var status: String
}

struct DogBreedImage: Codable {
    var message: [String]
    var status: String
}

typealias DogBreeds = [String: [String]]
typealias DogBreedImages = [String]

class DogBreedViewModel: ObservableObject {
    @Published var dogBreeds: DogBreeds = [:]
    @Published var dogImages: DogBreedImages = []
    @Published var errorMessage: String?
    
    init() {
        fetchDogBreeds()
    }
    
    func fetchDogBreeds() {
        APIService.shared.fetchDogBreeds { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let dogBreedResponse):
                    self.dogBreeds = dogBreedResponse.message
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func fetchDogBreedImages(breed: String) {
        APIService.shared.fetchDogBreedImages(for: breed) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let images):
                    self.dogImages = images.message
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
