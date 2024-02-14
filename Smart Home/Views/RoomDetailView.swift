//
//  RoomDetailView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct RoomDetailView: View {
    let roomID: Room.ID?
    
    var body: some View {
        if let roomID = roomID {
            // Get room from roomID
            if let room = roomData.first(where: { $0.id == roomID }) {
                VStack (alignment: .leading){
                    Text("\(room.name)")
                        .font(.title)
                        .padding(.top, 13)
                    Text("Temperature: \(room.temperature, specifier: "%.1f")º")
                        .font(.subheadline)
                    
                    // Each Device
                    // Rewrite this if non-demo.
                    HStack{
                        if (room.hasCamera) {
                            CameraWidget(title: "\(room.name)",
                                         onOff: room.camOn!)
                        }
                        if (room.hasLight) {
                            SmartApplianceWidget(title: "\(room.name) Light",
                                      strength: room.lightStrength!,
                                      type: "Light",
                                      onOff: room.lightOn!
                            )
                        }
                        if (room.hasTemp) {
                            SmartApplianceWidget(title: "\(room.name) \(room.tempType!)",
                                      strength: room.tempSetting!,
                                      type: room.tempType!,
                                      onOff: room.tempOn!)
                        }
                        if (room.hasShade) {
                            SmartApplianceWidget(title: "\(room.name) Shade",
                                      strength: 0,
                                      type: "Shade",
                                      onOff: room.shadeOpen!)
                        }
                        if (room.hasTV) {
                            SmartApplianceWidget(title: "\(room.name) TV",
                                      strength: 0,
                                      type: "TV",
                                      onOff: room.tvOn!)
                        }
                        if (room.hasOven) {
                            SmartApplianceWidget(title: "\(room.name) Oven",
                                      strength: room.ovenTemp!,
                                      type: "Oven",
                                      onOff: room.ovenOn!)
                        }
                    }
                }
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .padding()
            } else {
                Text("Room not found")
            }
        } else {
            Text("No Room Selected")
        }
    }
}

#Preview {
    RoomView()
}
