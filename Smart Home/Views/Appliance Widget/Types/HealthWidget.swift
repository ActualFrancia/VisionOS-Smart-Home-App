//
//  HealthWidget.swift
//  Smart Home
//
//  Created by Kali Francia on 2/20/24.
//

import SwiftUI

struct HealthWidget: View {
    let roomName: String
    @Binding var applianceData: Room.Appliance
    @State private var isSheetPresented = false
    
    // Button Color
    let buttonColor = Color.green.opacity(0.9)
    
    // Sheet Details
    private func sheetDetails() -> some View {
        HStack (alignment: .top) {
            WidgetUtils().powerButton(onOff: applianceData.isOn!, action: {
                applianceData.isOn!.toggle()
            })
            .padding(.trailing, 10)
            
            VStack{
                switch applianceData.type {
                case "Air Quality Monitor":
                    WidgetUtils().sheetList(type: "AQI", readApplianceData: applianceData)
                    WidgetUtils().sheetList(type: "PM", readApplianceData: applianceData)
                case "Dehumidifier":
                    WidgetUtils().sheetList(type: "Humidity", readApplianceData: applianceData)
                    WidgetUtils().sheetList(type: "Water Level", readApplianceData: applianceData)
                case "Humidifier":
                    WidgetUtils().sheetList(type: "Humidity", readApplianceData: applianceData)
                    WidgetUtils().sheetList(type: "Water Level", readApplianceData: applianceData)
                default:
                    Text("ERROR")
                }
            }
        }
    }
    
    // Widget Subtitle
    private func getSubtitle() -> String {
        if applianceData.isOn! {
            switch applianceData.type {
            case "Air Quality Monitor":
                return "Air Quality • \(WidgetUtils().aqiString(aqi: applianceData.airQualityIndex!))"
            case "Humidifier":
                fallthrough
            case "Dehumidifier":
                return "Humidity • \(applianceData.humidity!)%"
            default:
                return "On"
            }
        } else {
            return "Off"
        }
    }
    
    var body: some View {
        Button(action: {
            applianceData.isOn!.toggle()
        }) {
            VStack (alignment: .leading){
                HStack (alignment: .top) {
                    WidgetUtils().getSystemImage(type: applianceData.type!, isOn: applianceData.isOn!)
                    
                    Spacer()
                    WidgetUtils().showFavorite(fav: applianceData.favorite, action: {
                        applianceData.favorite.toggle()
                    })
                }
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text("\(roomName) \(applianceData.type!)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", isOn: applianceData.isOn!))
                        Text(getSubtitle())
                            .font(.caption)
                            .foregroundStyle(WidgetUtils().getColor(type: "Text", isOn: applianceData.isOn!))
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
            .onTapGesture(count: 2, perform: {
                isSheetPresented = true
            })
            .onLongPressGesture(perform: {
                isSheetPresented = true
            })
        }
        .buttonBorderShape(.roundedRectangle(radius: 25))
        .frame(width: 145, height: 145)
        // Health Sheet
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                WidgetUtils().sheetTitle(roomName: roomName, applianceData: $applianceData, sheetToggle: $isSheetPresented)
                
                sheetDetails()
            }
            .padding()
        })
    }
}

#Preview {
    RoomTabView()
}
