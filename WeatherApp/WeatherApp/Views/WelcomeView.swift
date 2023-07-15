//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Yanet Rodriguez on 13/07/2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Bienvenido a WeatherApp")
                    .bold()
                    .font(.title)
                Text("Es necesario que nos comparta su ubicación para obtener el clima en su área.").padding()
            }
            .multilineTextAlignment(.center)
            .padding()

            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
