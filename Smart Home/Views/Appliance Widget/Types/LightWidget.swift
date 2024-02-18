//
//  LightWidget.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import SwiftUI

struct LightWidget: View {
    let roomName: String
    @Binding var applianceData: Room.Appliance
    
    // Button Color
    let buttonColor = Color.yellow.opacity(0.9)
    
    private func getSubtitle() -> String {
        if applianceData.isOn! {
            return "On • \(Int(applianceData.strength!))%"
        } else {
            return "Off"
        }
    }
    
    var body: some View {
        Button(action: {
            applianceData.isOn?.toggle()
        }) {
            VStack (alignment: .leading){
                WidgetUtils().getSystemImage(type: applianceData.type!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(WidgetUtils().getColor(type: "Image", onOff: applianceData.isOn!))
                    .frame(height: 50)
                    .fixedSize()
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(roomName) \(applianceData.type!)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", onOff: applianceData.isOn!))
                        Text(getSubtitle())
                            .font(.caption)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", onOff: applianceData.isOn!))
                    }
                    Spacer()
                }
            }
            .padding()
            .frame(width: 145, height: 145)
            .background(
                 RoundedRectangle(cornerRadius: 25)
                    .fill(applianceData.isOn! ? buttonColor : Color.gray.opacity(0.3))
             )
        }
        .buttonBorderShape(.roundedRectangle(radius: 25))
        .frame(width: 145, height: 145)
    }
}

#Preview {
    RoomView()
}
