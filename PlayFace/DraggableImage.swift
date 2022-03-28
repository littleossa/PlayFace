//
//  DraggableImage.swift
//  PlayFace
//
//  Created by 平岡修 on 2022/03/28.
//

import SwiftUI

struct DraggableImage: View {
    
    @State private var location: CGPoint
    @State private var isDragging = false
    private let imageName: String
    
    init(_ systemName: String,
         defaultLocation: CGPoint) {
        imageName = systemName
        location = defaultLocation
    }
    
    /// Drag guesure
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                location = value.location
                isDragging = true
            }
            .onEnded { _ in
                isDragging = false
            }
    }
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .foregroundColor(isDragging ? .blue : .black)
            .frame(width: 100)
            .position(location)
        // Attache a drag gesture
            .gesture(dragGesture)
    }
}

struct DraggableImage_Previews: PreviewProvider {
    static var previews: some View {
        DraggableImage("eye", defaultLocation: CGPoint(x: 100, y: 100))
    }
}
