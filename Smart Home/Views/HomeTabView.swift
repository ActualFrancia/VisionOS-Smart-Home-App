//
//  HomeView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct HomeTabView: View {
    @ObservedObject private var houseData = HouseData.shared
    @ObservedObject private var sceneData = SceneData.shared
    
    // TODO: Fix Camera Buttons not being pressable outside of Rooms Tab
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Smart Home")
                .font(.largeTitle)
                .padding(.top, 16)
            ScrollView (.horizontal) {
                HStack {
                    ForEach (sceneData.scenes.indices, id:\.self) {i in
                        SceneUtils().sceneButton(sceneData: sceneData.scenes[i], houseData: houseData)
                    }
                }
            }
            .padding(.bottom, 10)
            HStack {
                VStack {
                    ScrollView {
                        ForEach (houseData.smartHome.rooms.indices, id:\.self) {i in
                            HStack {
                                VStack (alignment: .leading) {
                                    WidgetUtils().roomTitle(room: houseData.smartHome.rooms[i])
                                    WidgetWrapper(room: $houseData.smartHome.rooms[i], favoritesOnly: false)
                                }
                                .padding(.bottom, 10)
                                Spacer()
                            }
                        }
                    }
                }
                ScrollView {
                    // TODO: Rewrite ForEach Loop
                    
                    ForEach (houseData.smartHome.rooms.indices, id:\.self) {i in
                        let room = houseData.smartHome.rooms[i]
                        
                        ForEach (room.appliances.indices, id:\.self) {j in
                            if (room.appliances[j].0 == "Camera" && room.appliances[j].1.favorite) {
                                CamPageView(roomName: room.name, applianceData: $houseData.smartHome.rooms[i].appliances[j].1)
                            }
                        }
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding()
    }
}

#Preview {
    HomeTabView()
}
