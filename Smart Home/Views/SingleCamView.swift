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
    let title: Bool
    let size: String
    
    @State private var localOnOff: Bool
    
    init(room: String, onOff: Bool, title: Bool, size: String) {
        self.room = room
        self.onOff = onOff
        self.title = title
        self.size = size
        _localOnOff = State(initialValue: onOff)
    }
    
    var body: some View {
        VStack {
            if (title) {
                HStack {
                    Text("\(room) Camera")
                        .font(.title2)
                }
            }
            
            // Camera Footage
            LiveCamView(camera: room, size: size, onOff: localOnOff)
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
