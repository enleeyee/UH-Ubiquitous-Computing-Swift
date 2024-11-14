//
//  HomeView.swift
//  Exam3_Yii_Enlai
//
//  Created by Enlai Yii on 11/14/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text("WEATHER IMAGES")
                .font(.title)
                .foregroundColor((Color(red: 68/255, green: 98/255, blue: 140/255)))
            
            Spacer()

            Text("RAINBOW")
                .font(.title2)
                .foregroundColor((Color(red: 68/255, green: 98/255, blue: 140/255)))
            
            Spacer()
            
            Image("4")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding()
            
            Spacer()

            Button(action: {
                print("image button pressed")
            }) {
                Text("Bring Weather Image")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background((Color(red: 68/255, green: 98/255, blue: 140/255)))
                    .foregroundColor(Color(red: 218/255, green: 243/255, blue: 236/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            
            Spacer()
            
            Rectangle()
                .frame(height: 0)
                .background(.black)
        }
        .padding()
        .background(Color(red: 218/255, green: 243/255, blue: 236/255))
    }
}

#Preview {
    HomeView()
}
