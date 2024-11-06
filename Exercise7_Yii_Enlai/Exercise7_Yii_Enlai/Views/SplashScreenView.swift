//
//  SplashScreenView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "dog.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    Image(systemName: "cat.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                }
                
                Text("Pair Pets")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color(.black))
                
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
