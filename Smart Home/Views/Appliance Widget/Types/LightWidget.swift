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
    @State private var isSheetPresented = false
    @State private var sliderValue: Double
    
    init(roomName: String, applianceData: Binding<Room.Appliance>) {
        self.roomName = roomName
        self._applianceData = applianceData
        self._isSheetPresented = State(initialValue: false)
        self._sliderValue = State(initialValue: applianceData.strength.wrappedValue!)
    }
    
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
            applianceData.isOn!.toggle()
        }) {
            VStack (alignment: .leading){
                HStack (alignment: .top) {
                    WidgetUtils().getSystemImage(type: applianceData.type!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(WidgetUtils().getColor(type: "Image", onOff: applianceData.isOn!))
                        .frame(height: 50)
                        .fixedSize()
                    
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
            .onTapGesture(count: 2, perform: {
                isSheetPresented = true
            })
            .onLongPressGesture(perform: {
                isSheetPresented = true
            })
        }
        .buttonBorderShape(.roundedRectangle(radius: 25))
        .frame(width: 145, height: 145)
        // Light Strength Sheet
        .sheet(isPresented: $isSheetPresented, content: {
            VStack {
                WidgetUtils().sheetTitle(roomName: roomName, applianceData: $applianceData, sheetToggle: $isSheetPresented)
                
                HStack {
                    WidgetUtils().powerButton(onOff: applianceData.isOn!, action: {
                        applianceData.isOn!.toggle()
                    })
                    .padding(.trailing, 20)
                    
                    Spacer()
                    
                    Text("\(sliderValue, specifier: "%.0f")%")
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(width: 40)
                    Slider(value: $sliderValue, in: 0...100)
                        .onChange(of: sliderValue) {
                            applianceData.strength = sliderValue.rounded()
                            if applianceData.strength?.rounded() == 0.0 {
                                applianceData.isOn! = false
                            } else {
                                applianceData.isOn! = true
                            }
                        }
                }
            }
            .padding()
        })
    }
}

#Preview {
    RoomTabView()
}
