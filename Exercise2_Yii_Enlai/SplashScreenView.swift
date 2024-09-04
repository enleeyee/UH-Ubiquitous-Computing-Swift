//
//  SplashScreenView.swift
//  Exercise2_Yii_Enlai
//
//  Created by Enlai Yii on 9/3/24.
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
                Image("phoneLogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                Text("Phone Explorer")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 78/255, green: 85/255, blue: 159/255))
                
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
