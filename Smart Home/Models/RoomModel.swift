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
    // Favorites
    var favorites: [String]
    // Light
    var hasLight: Bool
    var lightOn: Bool?
    var lightStrength: Double?
    // Temperature
    var hasTemp: Bool
    var tempType: String?
    var tempOn: Bool?
    var tempSetting: Double?
    // Shades
    var hasShade: Bool
    var shadeOpen: Bool?
    // TV
    var hasTV: Bool
    var tvOn: Bool?
    // Oven
    var hasOven: Bool
    var ovenOn: Bool?
    var ovenTemp: Double?
    // Camera
    var hasCamera: Bool
    var camOn: Bool?
}

