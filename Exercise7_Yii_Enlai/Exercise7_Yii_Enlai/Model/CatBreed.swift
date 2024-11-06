//
//  CatBreed.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/5/24.
//

import Foundation

// breeds endpoint: https://api.thecatapi.com/v1/breeds
struct CatBreed: Codable {
    let weight: Weight
    let id, name: String
    let cfa_url: String?
    let vetstreet_url: String?
    let vcahospitals_url: String?
    let temperament, origin, country_codes, country_code: String
    let description, life_span: String
    let indoor: Int
    let lap: Int?
    let alt_names: String?
    let adaptability, affection_level, child_friendly, dog_friendly: Int
    let energy_level, grooming, health_issues, intelligence: Int
    let shedding_level, social_needs, stranger_friendly, vocalisation: Int
    let experimental, hairless, natural, rare: Int
    let rex, suppressed_tail, short_legs: Int
    let wikipedia_url: String?
    let hypoallergenic: Int
    let reference_image_id: String?
    let cat_friendly, bidability: Int?
}

struct Weight: Codable {
    let imperial, metric: String
}

// images endpoint: https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=REPLACE_ME&api_key=live_6vVCj2mP8mBkucsqqHBQV3AjHLiyJzgSEgwgZNjua8sMOkUIPOaeCakH9x25031C
struct CatBreedImage: Codable, Equatable {
    let id: String
    let url: String
    let width, height: Int
}

typealias CatBreeds = [CatBreed]
typealias CatBreedImages = [CatBreedImage]

class CatBreedViewModel: ObservableObject {
    @Published var catBreeds: CatBreeds = []
    @Published var errorMessage: String?

    init() {
        fetchCatBreeds()
    }

    func fetchCatBreeds() {
        APIService.shared.fetchCatBreeds { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let breeds):
                    self.catBreeds = breeds
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

class CatBreedImageViewModel: ObservableObject {
    @Published var catBreedImages: CatBreedImages = []
    @Published var errorMessage: String?

    func fetchCatBreedImages(breedId: String) {
        APIService.shared.fetchCatBreedImages(for: breedId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let images):
                    self.catBreedImages = images
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
