//
//  HomeView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI
import CoreML
import Vision

struct HomeView: View {
    @ObservedObject var dataModel: WeatherDataModel
    
    let images = ["1", "2", "3", "4", "5", "6", "8", "10", "11"]
    var imageClassifier: WeatherImageClassifier_1?
    
    @State var predictions: String?
    @State var currentIndex = 0

    init(dataModel: WeatherDataModel) {
        self.dataModel = dataModel
        
        do{
            imageClassifier = try WeatherImageClassifier_1(configuration: MLModelConfiguration())
        } catch {
            print(error)}
    }
    
    var body: some View {
        VStack {
            Spacer()
                        
            Text("WEATHER IMAGES")
                .font(.largeTitle)
                .foregroundColor(.customPrimary)
                        
            Spacer()
            
            Text(dataModel.target.uppercased())
                .font(.title2)
                .foregroundColor(.customPrimary)
            
            Spacer()

            Image(images[currentIndex])
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 400)
                .padding()
            
            Spacer()
            
            Button(action: {
                currentIndex = (currentIndex + 1) % images.count
                determineWeather()
            }) {
                Text("Bring Weather Image")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.customPrimary)
                    .foregroundColor(Color.customSecondary)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Rectangle()
                .frame(height: 0)
                .background(Color.customPrimary)
                .opacity(1)
        }
        .padding()
        .background(Color.customSecondary)
    }
    
    func determineWeather() {
        guard let uiImage = UIImage(named: images[currentIndex]) else {
            print("Image not found!")
            return
        }
        
        guard let pixelBuffer = uiImage.toCVPixelBuffer() else {
            print("Failed to convert image to pixel buffer!")
            return
        }
        
        do {
            if let result = try imageClassifier?.prediction(image: pixelBuffer) {
                dataModel.target = result.target
            } else {
                dataModel.target = "Unknown"
            }
        } catch {
            print("Error making prediction: \(error)")
            dataModel.target = "Error"
        }
        
        dataModel.imageName = images[currentIndex]
    }
}

#Preview() {
    HomeView(dataModel: WeatherDataModel())
}
