//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Олеся Егорова on 13.05.2023.
//

import SwiftUI

enum ColorTextField {
    case red, green, blue
}

struct ContentView: View {
    @State private var viewColor: Color = .red

    @State private var redSliderValue = 255.0
    @State private var greenSliderValue = 255.0
    @State private var blueSliderValue = 255.0

    //@State private var alertPresented = false

    @FocusState private var focusedField: ColorTextField?

    var body: some View {
        Color.gray
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    RoundedRectangleView(redSliderValue: redSliderValue,
                                         greenSliderValue: greenSliderValue,
                                         blueSliderValue: blueSliderValue)

                    ColorSliderView(value: $redSliderValue, textColor: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $greenSliderValue, textColor: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $blueSliderValue, textColor: .blue)
                        .focused($focusedField, equals: .blue)
                    Spacer()
                }
                    .padding())
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack(alignment: .center) {
                        Button {
                            goUp()
                        } label: {
                            Image(systemName: "chevron.up")
                        } .frame(width: 30)

                        Button {
                            goDown()
                        } label: {
                            Image(systemName: "chevron.down")
                        } .frame(width: 30)

                        Spacer()

                        Button("Done") {
                            focusedField = nil
                            //checkNumber(field: focusedField ?? .red)
                        }
                        .frame(width: 60)
//                        .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
//                            Text("Enter number 1...255")
//                        }
                    }
                }
            }
    }
    private func goUp() {
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
    private func goDown() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
//    private func checkNumber(field: ColorTextField) {
////        switch focusedField {
////        case .red:
////
////        case .green:
////            focusedField = .blue
////        default:
////            focusedField = .red
////        }
////        if let _ = String(field) {
////            alertPresented.toggle()
////            userName = ""
////            return
////        }
////        displayedName = userName
////        userName = ""
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


