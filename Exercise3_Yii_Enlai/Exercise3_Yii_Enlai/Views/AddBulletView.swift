//
//  AddBulletView.swift
//  Exercise3_Yii_Enlai
//
//  Created by Enlai Yii on 9/11/24.
//

import SwiftUI

struct AddBulletView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var bulletPoint: String
    @Binding var iphoneTitle: String
    @State private var showEmptyAlert = false
    
    var onSave: () -> Void
    
    var body: some View {
        
        HStack {
            Button(action: {
                print("Cancel")
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .bold()
                    .padding()
            })
            
            Spacer()
            
            Button(action: {
                
                if bulletPoint.isEmpty{
                    print("cannot empty")
                    showEmptyAlert = true
                } else {
                    print("Done")
                    onSave()
                    presentationMode.wrappedValue.dismiss()
                }
            }, label: {
                Text("Done")
                    .bold()
                    .padding()
            })
        }
        .alert(isPresented: $showEmptyAlert) {
            Alert(title: Text("Error"), message: Text("Bullet Point cannot be empty"), dismissButton: .default(Text("Okay")))
        }
        
        Text("ADD BULLET")
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color.rgb(78, 85, 159))
        
        VStack(alignment: .leading) {
            Text("\(iphoneTitle)")
        }
        .frame(minWidth: 350, minHeight: 45)
        .font(.title2)
        .bold()
        .background(Color.rgb(242, 104, 28))
        .foregroundColor(.white)
        .padding(.bottom, -10)
        
        VStack(alignment: .leading) {
            TextField("\(Image(systemName: "applelogo")) New Bullet Point", text: $bulletPoint)
                .padding()
                .autocorrectionDisabled()
        }
        .frame(width: 350, height: 50)
        .background(Color.rgb(241, 222, 198))
        .cornerRadius(1)
        
        Spacer()
    }
}

#Preview {
    AddBulletView(
        bulletPoint: .constant(""),
        iphoneTitle: .constant("iPhone 16"),
        onSave: {
            print("Save clicked")
        }
    )
}
