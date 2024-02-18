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
        ForEach (room.appliances.indices, id: \.self) { index in
            let applianceType = room.appliances[index].0
            
            if (applianceType == "Light") {
                LightWidget(roomName: room.name, applianceData: $room.appliances[index].1)
            }
        }
    }
}

#Preview {
    RoomView()
}
