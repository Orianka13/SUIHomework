//
//  RoundedRectangleView.swift
//  ColorizedApp
//
//  Created by Олеся Егорова on 13.05.2023.
//

import SwiftUI

struct RoundedRectangleView: View {
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(cgColor: CGColor(red: redSliderValue / 255,
                                                    green: greenSliderValue / 255,
                                                    blue: blueSliderValue / 255,
                                                    alpha: 1)))
            .frame(height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 4)
                    .foregroundColor(.white)
            )
            .padding(.bottom)
    }
}

struct RoundedRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangleView(redSliderValue: 50 / 255, greenSliderValue: 50 / 255, blueSliderValue: 50 / 255)
    }
}
