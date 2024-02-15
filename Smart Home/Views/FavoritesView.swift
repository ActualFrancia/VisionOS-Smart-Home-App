//
//  FavoritesView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var selectedRoom: Room?
    @State private var selectedRoomID: Room.ID?
    
    init() {
        _selectedRoomID = State(initialValue: roomData.first?.id)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Favorites")
                .font(.largeTitle)
            
            ScrollView {
                // Temp Code for Format Testing
                // TODO: REDO
                HStack {
                    VStack {
                        ForEach (roomData) { room in
                            if (room.favorites.count > 0) {
                                FavoritesDetailView(room: room)
                            }
                        }
                    }
                    VStack (alignment: .leading) {
                        ForEach (roomData) { room in
                            if (room.favorites.count > 0) {
                                if (room.favorites.contains("Camera")) {
                                    Text("\(room.name)")
                                        .font(.title)
                                    Text("Temperature: \(room.temperature, specifier: "%.1f")º")
                                        .font(.subheadline)
                                    SingleCamView(room: room.name, onOff: room.camOn!, title: false, size: "medium")
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .padding().padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    FavoritesView()
}
