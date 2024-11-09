//
//  ContentView.swift
//  Exercise8_Yii_Enlai Watch App
//
//  Created by Enlai Yii on 11/8/24.
//

import SwiftUI

struct ContentView: View {
    
    private var syncService = SyncService()
    @State private var receivedData: [String] = []
    var objectArray = ["❓","🏠","💻","🚗"]
    @State var objectIdx = 0
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                Text("Pᵃ")
                    .foregroundStyle(.red)
                    .font(.system(size: 36))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            Text(objectArray[objectIdx])
                .font(.system(size: 80))
                .foregroundColor(.red)
            
            Spacer()
              
            Rectangle()
                .frame(height: 0)
                .background(Color(red: 0/255, green: 249/255, blue: 235/255))
        }
        .background(Color(red: 0/255, green: 249/255, blue: 235/255))
        .edgesIgnoringSafeArea(.all)
        .onAppear { syncService.dataReceived = Receive }
    }
    
    private func Receive(key: String, value: Any) -> Void {
        self.receivedData.append("\(Date().formatted(date: .omitted, time: .standard)) - \(key):\(value)")
        self.objectIdx = Int("\(value)") ?? 0
    }
}

#Preview {
    ContentView()
}
