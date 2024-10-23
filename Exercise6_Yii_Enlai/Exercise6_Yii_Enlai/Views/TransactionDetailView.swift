//
//  TransactionDetailView.swift
//  Exercise6_Yii_Enlai
//
//  Created by Enlai Yii on 10/11/24.
//

import SwiftUI
import MapKit

struct Annotation: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var coordinate: CLLocationCoordinate2D
    
    // Create an MKPointAnnotation from this custom Annotation object
    var pointAnnotation: MKPointAnnotation {
        let point = MKPointAnnotation()
        point.title = title
        point.subtitle = subtitle
        point.coordinate = coordinate
        return point
    }
}

struct TransactionDetailView: View {
    var date: String
    var entry: Entry // Accept the Entry object
    
    @State private var region: MKCoordinateRegion
    @State private var annotations: [Annotation] = []
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    init(date: String, entry: Entry) {
        self.date = date
        self.entry = entry
        _region = State(initialValue: MKCoordinateRegion(
            center: entry.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Logo and Title
            HStack {
                AsyncImage(url: entry.logo) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 50)
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
            
            if verticalSizeClass == .regular
            {
                // Portrait Layout
                transactionDetailsView
                
                VStack {
                    MapView(region: $region, annotations: $annotations)
                        .frame(height: 400) // Set a fixed height for portrait
                }
                .onAppear {
                    addAnnotation()
                }
                
                Spacer()
            } else {
                // Landscape Layout
                HStack {
                    transactionDetailsView
                    
                    Spacer()
                    
                    VStack {
                        MapView(region: $region, annotations: $annotations)
                            .frame(width: 400, height: 250) // Set the size of the map for landscape
                    }
                    .onAppear {
                        addAnnotation()
                    }
                    
                    Spacer()
                }
            }
        }
        .padding()
        .navigationTitle("Transaction Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Extracted Transaction Details View
    private var transactionDetailsView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Date: \(date)")
                .bold()
            
            Text("Amount: \(entry.amount)")
                .bold()
            
            Text("Type: \(entry.type)")
            
            Text("Description: \(entry.description)")
            
            Text("Method: \(entry.method)")
            
            Text("Address: \(entry.address)")
            
            Text("Phone: \(entry.phone)")
        }
    }
    
    // Function to add the annotation
    private func addAnnotation() {
        // Reverse geocode to get more info about the location
        CLGeocoder().reverseGeocodeLocation(CLLocation(latitude: entry.cap_lat, longitude: entry.cap_long)) { placemarks, error in
            guard let place = placemarks?.first, error == nil else {
                return
            }
            // Create an annotation with the company's name and reverse-geocoded location info
            let initialAnnotation = Annotation(
                title: entry.title,
                subtitle: "\(place.locality ?? ""), \(place.administrativeArea ?? ""), \(place.isoCountryCode ?? "")",
                coordinate: entry.coordinate
            )
            annotations.append(initialAnnotation)  // Add the annotation to the map
        }
    }
}

#Preview {
    TransactionDetailView(date: "Jan 1, 1999", entry: Entry(logo: URL(string:"http://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/transactions/heb_logo.png")!, title: "Sample", amount: "$0", type: "Type", description: "Description", merchant_type: "Merchant", method: "Visa", address: "Address", cap_lat: 00.0000000, cap_long: 00.0000000, phone: "555-1234"))
}
