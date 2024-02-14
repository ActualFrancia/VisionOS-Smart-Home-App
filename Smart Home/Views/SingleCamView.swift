//
//  SingleCamView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/14/24.
//

import SwiftUI

struct SingleCamView: View {
    let room: String
    let onOff: Bool
    
    @State private var localOnOff: Bool
    
    init(room: String, onOff: Bool) {
        self.room = room
        self.onOff = onOff
        _localOnOff = State(initialValue: onOff)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(room) Camera")
                    .font(.title2)
            }
            
            // Camera Footage
            LiveCamView(camera: room, size: "large", onOff: localOnOff)
                .glassBackgroundEffect()
            
            // Power Button
            Button (action: {
                localOnOff.toggle()
            }) {
                Image(systemName: "power")
                Text("Turn \(localOnOff ? "Off" : "On")")
            }
            
            Spacer()
        }
    }
}

#Preview {
    RoomView()
}
