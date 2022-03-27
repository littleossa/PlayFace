//
//  ContentView.swift
//  PlayFace
//
//  Created by 平岡修 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    
    enum FaceParts: String, Identifiable, CaseIterable {
        
        case leftEye
        case rightEye
        case nose
        case mouth
        
        var id: String { rawValue }
        
        var imageName: String {
            switch self {
            case .leftEye, .rightEye:
                return "eye"
            case .nose:
                return "nose"
            case .mouth:
                return "mouth"
            }
        }
        
        var defaultPosition: CGPoint {
            switch self {
            case .leftEye:
                return CGPoint(x: 120, y: 200)
            case .rightEye:
                return CGPoint(x: 260, y: 200)
            case .nose:
                return CGPoint(x: 190, y: 300)
            case .mouth:
                return CGPoint(x: 190, y: 430)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.paleOrange)
            
            ForEach(FaceParts.allCases) {
                DraggableImage($0.imageName,
                               defaultLocation: $0.defaultPosition)
            }
        }
    }
}

extension Color {
    static let paleOrange = Color(red: 245 / 255, green: 218 / 255, blue: 195 / 255, opacity: 1)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
