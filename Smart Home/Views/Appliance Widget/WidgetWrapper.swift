//
//  WidgetWrapper.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import SwiftUI

struct WidgetWrapper: View {
    @Binding var room: Room
    
    var body: some View {
        HStack {
            ForEach (room.appliances.indices, id: \.self) { index in
                let applianceType = room.appliances[index].0
                
                switch applianceType {
                case "Camera":
                    CameraWidget(roomName: room.name, applianceData: $room.appliances[index].1)
                case "Light":
                    LightWidget(roomName: room.name, applianceData: $room.appliances[index].1)
                case "Temperature":
                    TemperatureWidget(roomName: room.name, applianceData: $room.appliances[index].1)
                default:
                    Text("Error")
                }
            }
        }
    }
}

#Preview {
    RoomTabView()
}
