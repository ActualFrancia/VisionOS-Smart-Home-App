//
//  RoomModel.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import Foundation

struct Room: Identifiable {
    let name: String
    let id = UUID()
    var temperature: Double
    // Dictionary
    var appliances: [(category: String, Appliance)]
    
    // Appliance
    struct Appliance {
        // Basics
        var favorite: Bool
        var type: String?
        var isOn: Bool?
        var strength: Double?
        var state: String?
        // Air Quality
        var airQualityIndex: Double?
        var particulateMatter: Double?
        var humidity: Int?
        // Humidity
        var waterLevel: Int?
    }
}

struct House {
    var rooms: [Room]
    
    // Add Room
    mutating func addRoom(newRoom: Room) {
        rooms.append(newRoom)
    }
    
    // TODO: Remove Room
}

