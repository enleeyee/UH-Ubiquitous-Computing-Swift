//
//  SplashScreenView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

//
//  SplashScreenView.swift
//  Exercise6_Yii_Enlai
//
//  Created by Enlai Yii on 10/11/24.
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
                Image(systemName: "dog.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Text("Dog Breeds")
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
