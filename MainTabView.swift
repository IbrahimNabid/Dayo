//
//  MainTabView.swift
//  Dayo
//
//  Created by Ibrahim Nabid on 12/15/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 2 // Add this line to define the selectedTab
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Weather()
                .tabItem {
                    Image(systemName: "cloud.fill")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Weather")
                }
                .tag(1)
            
            MainPage()
                .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.2, green: 0.8, blue: 0.8))
                        .imageScale(.large)
                    Text("Tasks")
                }
                .tag(2)
            
            Motivation()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .foregroundColor(Color(red: 0.4, green: 0.9, blue: 0.9))
                        .imageScale(.large)
                    Text("Motivation")
                }
                .tag(3)
        }
    }
    
    
    struct MainTabView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MainTabView()
            }
        }
    }
}
