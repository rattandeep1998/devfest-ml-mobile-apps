//
//  ContentView.swift
//  TestingClassifierApp
//
//  Created by Rattandeep Singh on 1/25/24.
//

import SwiftUI

import NaturalLanguage
import CoreML

let model: MLModel = try! MyNewTextClassifier(configuration: MLModelConfiguration()).model

let sentimentPredictor = try! NLModel(mlModel: model)

struct ContentView: View {
    @State private var text = ""
    @State private var res = ""

    var body: some View {
        Form {
            TextField("Text", text: $text)
            Text(res)
        }
        .padding()
        .onSubmit {
            res = ""
            print("Button Clicked")
            let result = sentimentPredictor.predictedLabel(for: text)
            res = result ?? ""
        }
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text(res ?? "Hello")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}

