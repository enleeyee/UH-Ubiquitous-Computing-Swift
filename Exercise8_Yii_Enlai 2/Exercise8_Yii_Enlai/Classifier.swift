//
//  Classifier.swift
//  Exercise8_Yii_Enlai
//
//  Created by Enlai Yii on 11/8/24.
//

import Foundation
import CoreML
import Vision
import CoreImage

struct Classifier {
    private(set) var objResult: String?
    private(set) var txtResult : String?

    mutating func detectObj(ciImage: CIImage) {
        let config = MLModelConfiguration()
        guard let model = try? VNCoreMLModel(for: Resnet50(configuration: config).model) else {
            fatalError("Couldn't load model")
        }

        let request = VNCoreMLRequest(model: model)
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        var classificationsText = ""
        
        for result in results {
            classificationsText += "\(Int(result.confidence * 100))% \(result.identifier) \n"
        }
        
        self.objResult = classificationsText
    }

    mutating func detectTxt(ciImage: CIImage) {
         
        let request = VNRecognizeTextRequest()
        
        request.recognitionLevel = .fast
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results else {
            return
        }

        let recognizedStrings = results.compactMap { result in
            result.topCandidates(1).first?.string
        }
        
        let classificationsResultText = recognizedStrings.joined(separator: ", ")
        
        self.txtResult = classificationsResultText
    }
}
