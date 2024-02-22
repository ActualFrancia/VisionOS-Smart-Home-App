//
//  FavoritesView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct FavoritesTabView: View {
    @ObservedObject private var houseData = HouseData.shared

    var body: some View {
        
        VStack (alignment: .leading) {
            Text("Favorites")
                .font(.largeTitle)
                .padding(.top, 16)
            
            HStack {
                ScrollView {
                    ForEach (houseData.smartHome.rooms.indices, id:\.self) {i in
                        HStack {
                            VStack (alignment: .leading) {
                                if WidgetUtils().checkRoomFavorites(room: houseData.smartHome.rooms[i], includeCamera: false) {
                                    WidgetUtils().roomTitle(room: houseData.smartHome.rooms[i])
                                    WidgetWrapper(room: $houseData.smartHome.rooms[i], favoritesOnly: true)
                                }
                            }
                            .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
                
                ScrollView {
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
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    FavoritesTabView()
}
