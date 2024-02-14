//
//  RoomView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct RoomView: View {
    
    @State private var selectedRoom: Room?
    @State private var selectedRoomID: Room.ID?
    
    init() {
        _selectedRoomID = State(initialValue: roomData.first?.id)
    }
    
    var body: some View {
        NavigationView {
            List(roomData, id: \.id, selection: $selectedRoomID) { room in
                NavigationLink(destination: RoomDetailView(roomID: selectedRoomID)) {
                    HStack {
                        Image(systemName: "square.split.bottomrightquarter")
                        Text(room.name)
                    }
                }
            }
            .navigationTitle("Rooms")
            .listStyle(InsetListStyle())
            
            RoomDetailView(roomID: selectedRoomID)
        }
    }
}

#Preview {
    RoomView()
}
