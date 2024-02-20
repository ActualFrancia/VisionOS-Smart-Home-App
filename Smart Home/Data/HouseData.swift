//
//  RoomData.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import Foundation

// Demo SmartHome data for Demo purposes.
class HouseData: ObservableObject {
    @Published var smartHome = House(rooms: [
        Room(name: "Family Room",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(favorite: true, type: "Thermostat", isOn: true, strength: 23, state: "Auto")),
                ("Light", Room.Appliance(favorite: true, type: "Ceiling Light", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(favorite: false, type: "Fan", isOn: true, strength: 67, state: "Summer")),
                ("Health", Room.Appliance(favorite: true, type:"Air Quality Monitor", isOn: true, airQualityIndex: 25, particulateMatter: 13.4, humidity: 11)),
                ]),
        
        Room(name: "Kitchen",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(favorite: true, type: "Thermostat", isOn: true, strength: 23, state: "Auto")),
                ("Light", Room.Appliance(favorite: false, type: "Floor Lamp", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(favorite: false, type: "Fan", isOn: true, strength: 67, state: "Summer")),
                ("Light", Room.Appliance(favorite: true, type: "Light Strip", isOn: true, strength: 100)),
                ]),
        
        Room(name: "Office",
             temperature: 24,
             appliances: [
                ("Temperature", Room.Appliance(favorite: false, type: "Thermostat", isOn: true, strength: 23, state: "Auto")),
                ("Light", Room.Appliance(favorite: true, type: "Floor Lamp", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(favorite: true, type: "Fan", isOn: true, strength: 67, state: "Summer")),
                ("Health", Room.Appliance(favorite: true, type:"Dehumidifier", isOn: true, humidity: 7, waterLevel: 39)),
                ]),
        
        Room(name: "Kid's Bedroom",
             temperature: 24,
             appliances: [
                ("Light", Room.Appliance(favorite: false, type: "Floor Lamp", isOn: true, strength: 100)),
                ("Temperature", Room.Appliance(favorite: false, type: "Standing Fan", isOn: false, strength: 33, state: "Summer")),
                ]),
        
        Room(name: "Front Door",
             temperature: 21,
             appliances: [
                ("Camera", Room.Appliance(favorite: true)),
                ]),
        
        Room(name: "Garden",
             temperature: 20,
             appliances: [
                ("Camera", Room.Appliance(favorite: true)),
                ("Light", Room.Appliance(favorite: false, type: "Light Strip", isOn: true, strength: 100)),
                ])
    ])
    
    // Singleton Pattern
    static let shared = HouseData()
    private init() {}
}
