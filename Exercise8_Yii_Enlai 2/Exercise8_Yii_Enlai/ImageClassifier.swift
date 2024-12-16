//
//  ImageClassifier.swift
//  Exercise8_Yii_Enlai
//
//  Created by Enlai Yii on 11/8/24.
//

import Foundation
import SwiftUI

class ImageClassifier: ObservableObject {
    @Published private var classifier =  Classifier()
    
    var imageClass: String? {
        classifier.objResult
    }
    
    var imageText : String? {
        classifier.txtResult
    }
    
    func detectObj (uiImage: UIImage) {
         guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detectObj(ciImage: ciImage)
    }

    func detectTxt (uiImage: UIImage) {
         guard let ciImage = CIImage(image: uiImage) else { return }
        classifier.detectTxt(ciImage: ciImage)
    }
}
