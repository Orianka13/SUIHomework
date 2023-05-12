//
//  NextButtonView.swift
//  TrafficLight
//
//  Created by Олеся Егорова on 12.05.2023.
//

import SwiftUI

struct NextButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color(red: 0, green: 0, blue: 0.5))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
    }
}

struct NextButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NextButtonView(title: "NEXT", action: {})
    }
}
