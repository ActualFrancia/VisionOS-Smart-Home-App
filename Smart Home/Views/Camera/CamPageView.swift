//
//  SingleCamView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/19/24.
//

import SwiftUI

struct CamPageView: View {
    let roomName: String
    @Binding var applianceData: Room.Appliance
    
    var body: some View {
        VStack {
            HStack {
                // TODO: Fix Tab Closing when Favorite is Toggled.
                WidgetUtils().favoriteButton(fav: applianceData.favorite, action: {
                    applianceData.favorite.toggle()
                })
                Text("\(roomName) Camera")
                    .font(.title2)
                
                Spacer()
                
                Text("Live")
                    .font(.headline)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.red.opacity(0.9))
                    )
            }
            LiveCamView(roomName: roomName, camSize: "page")
            Spacer()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

#Preview {
    RoomTabView()
}
