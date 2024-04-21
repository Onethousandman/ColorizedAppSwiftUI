//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Никита Тыщенко on 21.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .frame(height: 150)
                    .foregroundStyle(
                        Color(
                            red: redSliderValue/255,
                            green: greenSliderValue/255,
                            blue: blueSliderValue/255
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 5)
                    )
                
                ColorSliderView(sliderValue: $redSliderValue)
                    .tint(.red)
                ColorSliderView(sliderValue: $greenSliderValue)
                    .tint(.green)
                ColorSliderView(sliderValue: $blueSliderValue)
                    .tint(.blue)
                
                Spacer()
            }
            .padding()
        }
    }
    
}

#Preview {
    ContentView()
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text(lround(sliderValue).formatted())
                .foregroundStyle(.white)
            Slider(value: $sliderValue, in: 0...255, step: 1)
        }
    }
}
