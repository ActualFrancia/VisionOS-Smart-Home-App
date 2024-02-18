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
    var appliances: [(String, Appliance)]
    
    // Appliance
    struct Appliance {
        var type: String?
        var isOn: Bool?
        var strength: Double?
        var state: String?
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

