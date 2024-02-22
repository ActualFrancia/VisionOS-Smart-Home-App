//
//  WidgetWrapper.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import SwiftUI

struct WidgetWrapper: View {
    @Binding var room: Room
    var favoritesOnly: Bool
    
    private func widgetRouter(index: Int) -> some View {
        let applianceType = room.appliances[index].0
        
        switch applianceType {
        case "Camera":
            return AnyView(CameraWidget(roomName: room.name, applianceData: $room.appliances[index].1))
        case "Light":
            return AnyView(LightWidget(roomName: room.name, applianceData: $room.appliances[index].1))
        case "Temperature":
            return AnyView(TemperatureWidget(roomName: room.name, applianceData: $room.appliances[index].1))
        case "Health":
            return AnyView(HealthWidget(roomName: room.name, applianceData: $room.appliances[index].1))
        default:
            return AnyView(Text("Error"))
        }
    }
    
    var body: some View {
        HStack {
            ForEach (room.appliances.indices, id: \.self) { i in                
                // Favorites Only?
                if ((favoritesOnly == false) || (favoritesOnly && room.appliances[i].1.favorite && room.appliances[i].0 != "Camera")) {
                    widgetRouter(index: i)

                }
            }
        }
    }
}

#Preview {
    RoomTabView()
}
