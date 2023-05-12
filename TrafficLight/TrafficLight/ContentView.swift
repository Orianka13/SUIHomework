//
//  ContentView.swift
//  TrafficLight
//
//  Created by Олеся Егорова on 11.05.2023.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {

    @State private var buttonLabel = "START"

    @State private var redLightState = 0.3
    @State private var yellowLightState = 0.3
    @State private var greenLightState = 0.3

    @State private var currentLight = CurrentLight.red

    var body: some View {
        Color.black
            .edgesIgnoringSafeArea(.all)
            .overlay(VStack(spacing: 20) {
                ColorCircleView(color: .red, opacity: redLightState)
                ColorCircleView(color: .yellow, opacity: yellowLightState)
                ColorCircleView(color: .green, opacity: greenLightState)
                Spacer()

                NextButtonView(title: buttonLabel) {
                    if buttonLabel == "START" {
                        buttonLabel = "NEXT"
                    }
                    changeLight()
                }
            }
                .padding())
    }

    private func changeLight() {
        let lightIsOn = 1.0
        let lightIsOff = 0.3

        switch currentLight {
        case .red:
            currentLight = .yellow
            greenLightState = lightIsOff
            redLightState = lightIsOn
        case .yellow:
            currentLight = .green
            redLightState = lightIsOff
            yellowLightState = lightIsOn
        case .green:
            currentLight = .red
            greenLightState = lightIsOn
            yellowLightState = lightIsOff
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
