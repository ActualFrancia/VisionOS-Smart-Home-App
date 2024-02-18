//
//  RoomView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct RoomView: View {
    
    @ObservedObject private var houseData = HouseData.shared
    
    var body: some View {
        NavigationView {
            List(houseData.smartHome.rooms.indices, id: \.self) { index in
                NavigationLink(destination: RoomDetailView(room: $houseData.smartHome.rooms[index])) {
                    HStack {
                        Image(systemName: "square.split.bottomrightquarter")
                        Text("\(houseData.smartHome.rooms[index].name)")
                    }
                }
            }
            .navigationTitle("Rooms")
            .listStyle(InsetListStyle())
        }
    }
}

#Preview {
    RoomView()
}
