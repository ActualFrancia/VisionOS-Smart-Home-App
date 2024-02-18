//
//  RoomDetailView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct RoomDetailView: View {
    @Binding var room: Room
    
    var body: some View {
        VStack (alignment: .leading){
            Text("\(room.name)")
                .font(.title)
                .padding(.top, 13)
            Text("Temperature: \(room.temperature, specifier: "%.1f")º")
                .font((.subheadline))
            
            // Applicance widgets
            WidgetWrapper(room: $room)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topLeading)
        .padding()
    }
}

#Preview {
    RoomView()
}
