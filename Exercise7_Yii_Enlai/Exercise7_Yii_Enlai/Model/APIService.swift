//
//  APIService.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/5/24.
//

import Foundation

class APIService {
    static let shared = APIService()

    private let catBreedsURL = "https://api.thecatapi.com/v1/breeds"
    private let dogBreedsURL = "https://dog.ceo/api/breeds/list/all"
    private let catBreedImagesURL = "https://api.thecatapi.com/v1/images/search?limit=10&api_key=live_6vVCj2mP8mBkucsqqHBQV3AjHLiyJzgSEgwgZNjua8sMOkUIPOaeCakH9x25031C&breed_ids="


    func fetchCatBreeds(
        completion: @escaping (Result<CatBreeds, Error>) -> Void
    ) {
        guard let url = URL(string: catBreedsURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let catBreeds = try JSONDecoder().decode(
                        CatBreeds.self, from: data)
                    completion(.success(catBreeds))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchCatBreedImages(
        for breedId: String,
        completion: @escaping (Result<CatBreedImages, Error>) -> Void
    ) {
        let urlWithBreedId = "\(catBreedImagesURL)\(breedId)"
        guard let url = URL(string: urlWithBreedId) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let catBreedImages = try JSONDecoder().decode(
                        CatBreedImages.self, from: data)
                    completion(.success(catBreedImages))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    func fetchDogBreeds(
        completion: @escaping (Result<DogBreed, Error>) -> Void
    ) {
        guard let url = URL(string: dogBreedsURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let dogBreedResponse = try JSONDecoder().decode(DogBreed.self, from: data)
                    completion(.success(dogBreedResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchDogBreedImages(
        for breed: String,
        completion: @escaping (Result<DogBreedImage, Error>) -> Void
    ) {
        let breedImagesURL = "https://dog.ceo/api/breed/\(breed)/images"
        guard let url = URL(string: breedImagesURL) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let dogBreedImages = try JSONDecoder().decode(
                        DogBreedImage.self, from: data)
                    completion(.success(dogBreedImages))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
