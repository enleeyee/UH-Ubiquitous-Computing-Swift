//
//  ViewModelWatch.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//

import SwiftUI
import Foundation
import WatchConnectivity

class ViewModelWatch: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    
    @Published var messageText = "Waiting for the image" // Published property for message text
    @Published var dogImage = UIImage(systemName: "circle.fill")
    @Published var catImage = UIImage(systemName: "circle.fill")
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    
    // MARK: - WCSessionDelegate Methods
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageText = message["message"] as? String ?? "Unknown" // Update messageText property
        }
    }
    
    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            // Here we assume the dog image is sent first, followed by the cat image.
            // This logic could be adjusted if more reliable data identification is needed.
            if self.dogImage == UIImage(systemName: "circle.fill") {
                self.dogImage = UIImage(data: messageData) // First image received is the dog image
            } else {
                self.catImage = UIImage(data: messageData) // Second image received is the cat image
            }
        }
    }
}
