//
//  LightWidget.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import SwiftUI

struct CameraWidget: View {
    let roomName: String
    @Binding var applianceData: Room.Appliance
    
    // Button Color
    let buttonColor = Color.white.opacity(0.5)
    
    var body: some View {
        NavigationLink (destination: CamPageView(roomName: roomName, applianceData: $applianceData)) {
            VStack (alignment: .leading){
                HStack (alignment: .top) {
                    WidgetUtils().getSystemImage(type: "Camera", isOn: true)

                    
                    Spacer()
                    WidgetUtils().showFavorite(fav: applianceData.favorite, action: {
                        applianceData.favorite.toggle()
                    })
                }
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(roomName)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", isOn: true))
                        Text("Camera")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", isOn: true))
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .opacity(0.8)
                }
            }
            .padding()
            .frame(width: 145, height: 145)
            .background(
                 RoundedRectangle(cornerRadius: 25)
                    .fill(buttonColor)
             )
        }
        .buttonBorderShape(.roundedRectangle(radius: 25))
        .frame(width: 145, height: 145)
    }
}

#Preview {
    RoomTabView()
}
