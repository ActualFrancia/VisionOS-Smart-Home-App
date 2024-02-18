//
//  RoomData.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import Foundation

// Demo House data for Demo purposes.
class HouseData: ObservableObject {
    @Published var smartHome = House(rooms: [
        Room(name: "Family Room",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(type: "Thermostat", isOn: true, state: "Auto")),
                ("Light", Room.Appliance(type: "Ceiling Light", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(type: "Fan", isOn: true, state: "Summer"))
                ,]),
        
        Room(name: "Kitchen",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(type: "Thermostat", isOn: true, state: "Auto")),
                ("Light", Room.Appliance(type: "Floor Lamp", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(type: "Fan", isOn: true, state: "Summer")),
                ("Light", Room.Appliance(type: "Light Strip", isOn: true, strength: 100))
                ,]),
        
        Room(name: "Office",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(type: "Thermostat", isOn: true, state: "Auto")),
                ("Light", Room.Appliance(type: "Floor Lamp", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(type: "Fan", isOn: true, state: "Summer"))
                ,])
    ])
    
    // Singleton Pattern
    static let shared = HouseData()
    private init() {}
}
