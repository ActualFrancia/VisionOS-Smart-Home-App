//
//  CamView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

// TODO: Rewrite ForEach Loop

struct CamTabView: View {
    @ObservedObject private var houseData = HouseData.shared

    var body: some View {
        VStack (alignment: .leading) {
            Text("Cameras")
                .font(.largeTitle)
                .padding(.top, 16)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach (houseData.smartHome.rooms.indices, id:\.self) {i in
                        let room = houseData.smartHome.rooms[i]
                        
                        ForEach (room.appliances.indices, id:\.self) {j in
                            if (room.appliances[j].0 == "Camera") {
                                CamPageView(roomName: room.name, applianceData: $houseData.smartHome.rooms[i].appliances[j].1)
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CamTabView()
}
