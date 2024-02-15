//
//  RoomData.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import Foundation

// Demo data for Demo purposes.

let roomData: [Room] = [
    Room(name: "Family Room",
         temperature: 72.5,
         // Favorites
         favorites: ["Light", "Temp"],
         // Light
         hasLight: true,
         lightOn: true,
         lightStrength: 100,
         // Temp
         hasTemp: true,
         tempType: "Thermometer",
         tempOn: true,
         tempSetting: 75,
         // Shade
         hasShade: true,
         shadeOpen: false,
         // TV
         hasTV: true,
         tvOn: true,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: true,
         camOn: true
        ),
    
    Room(name: "Master Bedroom",
         temperature: 68.0,
         // Favorites
         favorites: [],
         // Light
         hasLight: true,
         lightOn: false,
         lightStrength: 67,
         // Temp
         hasTemp: true,
         tempType: "Fan",
         tempOn: true,
         tempSetting: 67,
         // Shade
         hasShade: true,
         shadeOpen: true,
         // TV
         hasTV: true,
         tvOn: false,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: false
        ),
    
    Room(name: "Kitchen",
         temperature: 71.3,
         // Favorites
         favorites: ["Light"],
         // Light
         hasLight: true,
         lightOn: true,
         lightStrength: 90,
         // Temp
         hasTemp: false,
         // Shade
         hasShade: false,
         // TV
         hasTV: false,
         tvOn: false,
         // Oven
         hasOven: true,
         ovenOn: true,
         ovenTemp: 350,
         // Camera
         hasCamera: true,
         camOn: false
        ),
    
    Room(name: "Office", 
         temperature: 75.0,
         // Favorites
         favorites: ["Temp"],
         // Light
         hasLight: true,
         lightOn: true,
         lightStrength: 67,
         // Temp
         hasTemp: true,
         tempType: "Fan",
         tempOn: true,
         tempSetting: 33,
         // Shade
         hasShade: true,
         shadeOpen: true,
         // TV
         hasTV: false,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: false
        ),
    
    Room(name: "Kid's Bedroom", 
         temperature: 69.2,
         // Favorites
         favorites: [],
         // Light
         hasLight: true,
         lightOn: false,
         lightStrength: 100,
         // Temp
         hasTemp: true,
         tempType: "Fan",
         tempOn: false,
         tempSetting: 75,
         // Shade
         hasShade: false,
         // TV
         hasTV: false,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: false
        ),
    
    Room(name: "Front Door",
         temperature: 82,
         // Favorites
         favorites: ["Camera"],
         // Light
         hasLight: false,
         // Temp
         hasTemp: false,
         // Shade
         hasShade: false,
         // TV
         hasTV: false,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: true,
         camOn: true
        ),
    
    Room(name: "Backyard",
         temperature: 82,
         // Favorites
         favorites: ["Camera"],
         // Light
         hasLight: false,
         // Temp
         hasTemp: false,
         // Shade
         hasShade: false,
         // TV
         hasTV: false,
         // Oven
         hasOven: false,
         // Camera
         hasCamera: true,
         camOn: false
        )
]

