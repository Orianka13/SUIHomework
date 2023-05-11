//
//  ColorCircleView.swift
//  TrafficLight
//
//  Created by Олеся Егорова on 11.05.2023.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    var opacity: Double

    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .opacity(opacity)
    }
}

struct ColorCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleView(color: .red, opacity: 0.5)
    }
}
