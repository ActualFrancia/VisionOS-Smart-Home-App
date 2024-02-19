//
//  ContentView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Smart Home")
                }
            FavoritesTabView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            RoomTabView()
                .tabItem {
                    Image(systemName: "square.split.bottomrightquarter.fill")
                    Text("Rooms")
                }
            CamTabView()
                .tabItem {
                    Image(systemName: "web.camera.fill")
                    Text("Cameras")
                }
            SceneTabView()
                .tabItem {
                    Image(systemName: "circle.grid.3x3.circle")
                    Text("Scenes")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
