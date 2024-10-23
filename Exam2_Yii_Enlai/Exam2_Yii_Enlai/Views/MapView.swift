//
//  MapView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515), // Default location: Germany
        span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
    )
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var showSearchBar = false
    @State private var savedLocation: MKCoordinateRegion? // Store the saved location
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Map(coordinateRegion: $mapRegion)
                    .ignoresSafeArea(edges: [.top, .horizontal]) // Map respects the bottom safe area for the tab bar
                
                if showSearchBar {
                    HStack {
                        TextField("Search for a country", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                        
                        Button(action: {
                            saveCurrentLocation()
                            searchText = ""
                            showSearchBar = false
                        }) {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                } else {
                    HStack {
                        Spacer()
                        Button(action: {
                            showSearchBar.toggle()
                        }) {
                            Image(systemName: "magnifyingglass")
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding()
                    }
                }
            }
        }
        .onAppear {
            setDefaultLocation()
        }
        .onSubmit {
            performMapSearch()
        }
    }
    
    private func setDefaultLocation() {
        // Set Germany as the default region
        let germanyLocation = CLLocationCoordinate2D(latitude: 51.1657, longitude: 10.4515)
        mapRegion = MKCoordinateRegion(center: germanyLocation, span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
    }
    
    private func performMapSearch() {
        guard !searchText.isEmpty else { return }
        isSearching = true
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            isSearching = false
            if let error = error {
                print("Search error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response, let mapItem = response.mapItems.first else {
                print("No results found")
                return
            }
            
            let coordinate = mapItem.placemark.coordinate
            mapRegion = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0))
        }
    }
    
    private func saveCurrentLocation() {
        // Save the current map region as the saved location
        savedLocation = mapRegion
        print("Location saved: \(savedLocation?.center.latitude ?? 0), \(savedLocation?.center.longitude ?? 0)")
    }
}

#Preview {
    MapView()
}
