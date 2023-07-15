//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Yanet Rodriguez on 14/07/2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()

                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "moon")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)

                        Spacer()

                        Text(weather.main.feelsLike.roundDouble() + "º")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()

                    AsyncImage(url: URL(string: "https://i.pinimg.com/originals/f5/d5/33/f5d533f4dcda831716ee971fca70b66d.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500)
                            .colorInvert()
                    } placeholder: {
                        LoadingView()
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)

                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "º")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "º")
                    }

                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color("Teal"))
                .background(Color("Orange"))
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("Teal"))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
