//
//  BackgroundView.swift
//  WeatherForeCast
//
//  Created by Venkat_Sravani on 8/27/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        let clodyScheme = [Color(red: 41/255, green: 128/255, blue: 184/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color.white]

        let colorScheme : [Color] = clodyScheme
        
        let gradient = Gradient(colors: colorScheme)
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        
        let background = Rectangle()
            .fill(linearGradient)
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
        
        return background
    }
}
