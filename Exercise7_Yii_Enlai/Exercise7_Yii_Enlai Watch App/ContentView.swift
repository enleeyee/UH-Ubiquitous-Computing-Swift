//
//  ContentView.swift
//  Exercise7_Yii_Enlai Watch App
//
//  Created by Enlai Yii on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModelWatch = ViewModelWatch()
    
    var body: some View {
        VStack {
            // Display hearts at the top of the screen
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            .padding(.bottom, 10)
            
            // Display dog and cat images side by side
            HStack {
                if let dogImage = viewModelWatch.dogImage {
                    Image(uiImage: dogImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .cornerRadius(10)
                } else {
                    // Placeholder for dog image
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.gray)
                }
                
                if let catImage = viewModelWatch.catImage {
                    Image(uiImage: catImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .cornerRadius(10)
                } else {
                    // Placeholder for cat image
                    Image(systemName: "circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.gray)
                }
            }
            
            // Display any additional message received
            Text(viewModelWatch.messageText)
                .font(.caption)
                .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
