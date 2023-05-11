//
//  ContentView.swift
//  TrafficLight
//
//  Created by Олеся Егорова on 11.05.2023.
//

import SwiftUI

struct ContentView: View {

    @State private var tapCount = 0
    @State private var buttonLabel = "START"
    @State private var redCircle = ColorCircleView(color: .red, opacity: 0.5)
    @State private var yellowCircle = ColorCircleView(color: .yellow, opacity: 0.5)
    @State private var greenCircle = ColorCircleView(color: .green, opacity: 0.5)

    var body: some View {
        Color.black
            .edgesIgnoringSafeArea(.all)
            .overlay(VStack {
                redCircle
                    .padding(.top, 20)
                yellowCircle
                greenCircle
                Spacer()

                Button(action: changeLight) {
                    Text(buttonLabel)
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color(red: 0, green: 0, blue: 0.5))
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                }
            })
    }

    private func changeLight() {
        if buttonLabel == "START" {
            buttonLabel = "NEXT"
        }

        switch tapCount {
        case 0:
            greenCircle.opacity = 0.3
            redCircle.opacity = 1
            tapCount += 1
        case 1:
            redCircle.opacity = 0.3
            yellowCircle.opacity = 1
            tapCount += 1
        default:
            yellowCircle.opacity = 0.3
            greenCircle.opacity = 1
            tapCount = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
