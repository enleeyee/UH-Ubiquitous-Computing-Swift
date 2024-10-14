//
//  TransactionDetailView.swift
//  Exercise5_Yii_Enlai
//
//  Created by Enlai Yii on 10/9/24.
//

import SwiftUI

struct TransactionDetailView: View {
    let entry: Entry // Accept the Entry object

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Logo and Title
            HStack {
                AsyncImage(url: URL(string: entry.logo)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(entry.title)
                        .font(.title)
                        .bold()
                    Text(entry.merchant_type)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.top)
            
            Divider()
            
            Text("Date: \(entry.description)")
                .bold()
            
            Text("Amount: \(entry.amount)")
                .bold()
            
            Text("Type: \(entry.type)")
            
            Text("Description: \(entry.description)")
            
            Text("Method: \(entry.method)")
            
            Text("Address: \(entry.address)")
            
            Text("Phone: \(entry.phone)")
            
            Spacer()
        }
        .padding()
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    TransactionDetailView(entry: Entry(logo: "", title: "Sample", amount: "$0", type: "Type", description: "Description", merchant_type: "Merchant", method: "Visa", address: "Address", phone: "555-1234"))
}
