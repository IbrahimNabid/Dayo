//
//  WelcomeView.swift
//  Dayo
//
//  Created by Ibrahim Nabid on 12/12/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    Text("🌤 Hello from Dayo's Weather Wizard! 🌦")
                        .bold()
                        .font(.title)
                    
                    Text("We're excited to have you here! To make your experience even better, we'd love to show you the weather in your area. Could you please share your current location with us?")
                        .padding()
                        .font(.headline)
                }
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                .padding()
                Text("Don't worry, your location is only used to provide accurate weather data and won't be shared with anyone else. 🌈")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing])
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct WelcomeView_Previews : PreviewProvider {
    static var previews : some View {
        WelcomeView()
    }
}
