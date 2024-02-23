//
//  HouseSceneData.swift
//  Smart Home
//
//  Created by Kali Francia on 2/23/24.
//

import Foundation
import SwiftUI

class SceneData: ObservableObject {
    @Published var scenes: [houseScene] = [
        houseScene(
            name: "Good Morning",
            subtitle: "Turn all lights on.",
            image: "sun.horizon.fill",
            color: Color.yellow,
            appliances: [("All", "Light", "isOn", "On")]),
        
        houseScene(
            name: "Good Night",
            subtitle: "Turn all lights off.",
            image: "moon.zzz.fill",
            color: Color.blue,
            appliances: [("All", "Light", "isOn", "Off")]),
        
        houseScene(
            name: "Date Night",
            subtitle: "Dim all the lights to 10%.",
            image: "heart.circle.fill",
            color: Color.red,
            appliances: [("All", "Light", "strength", "10")]),

        houseScene(
            name: "Movie Night",
            subtitle: "Turn off Family Room lights.",
            image: "movieclapper.fill",
            color: Color.purple,
            appliances: [("All", "Light", "isOn", "Off")]),
    ]
    
    // Singleton Pattern
    static let shared = SceneData()
    private init() {}
}
