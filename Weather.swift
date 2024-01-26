//
//  Weather.swift
//  Dayo
//
//  Created by Ibrahim Nabid on 12/8/23.
//

import SwiftUI

struct Weather: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    @State private var isRefreshing = false

    var body: some View {
        NavigationView {
            NavigationLink(destination: Login()) {
                Spacer()
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 40)
                    .background(Color.orange)
                    .cornerRadius(15.0)
                    .padding(.bottom, 20)
                    .padding(.leading, 10)
            }
            Spacer()
        }
            List {
                VStack {
                    if let location = locationManager.location {
                        if let weather = weather {
                            WeatherDetailView(weather: weather)
                        } else {
                            LoadingView()
                                .task {
                                    do {
                                        isRefreshing = true
                                        weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                    } catch {
                                        print("Error getting weather: \(error)")
                                    }
                                    isRefreshing = false
                                }
                        }
                    } else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }

                    Spacer()
                }
            }
            .refreshable {
                do {
                    isRefreshing = true
                    weather = try await weatherManager.getCurrentWeather(latitude: locationManager.location?.latitude ?? 0, longitude: locationManager.location?.longitude ?? 0)
                } catch {
                    print("Error getting weather: \(error)")
                }
                isRefreshing = false
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
            .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .preferredColorScheme(.dark)
        }
    }

struct WeatherDetailView: View {
    var weather: ResponseBody

    var body: some View {
        ZStack {
            VStack {
                Image("clouds")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 50)
                Text("\(weather.name)")
                    .font(.title)
                    .bold()
                Text("Today, \(Date(), style: .date) \(Date(), style: .time)")
                Text(weather.weather.first?.main ?? "")
                    .font(.headline)

                Text("Temperature: \(Int(weather.main.temp))°F")
                Text("Feels Like: \(Int(weather.main.feelsLike))°F")

                HStack {
                    VStack {
                        Text("Min Temperature: \(Int(weather.main.tempMin))°F")
                        Text("Max Temperature: \(Int(weather.main.tempMax))°F")

                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    VStack {
                        Text("Humidity: \(Int(weather.main.humidity))%")
                        Text("Wind Speed: \(weather.wind.speed) MPH")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
    }
}


struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        Weather()
    }
}
