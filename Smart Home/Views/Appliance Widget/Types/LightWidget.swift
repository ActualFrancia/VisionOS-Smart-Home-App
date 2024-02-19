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
                HStack {
                    WidgetUtils().getSystemImage(type: applianceData.type!)
                    Text("\(roomName) \(applianceData.type!)")
                        .font(.title3)
                    Spacer()
                    // Close Button
                    Button(action: {
                        isSheetPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .fixedSize()
                    }
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                }
                
                HStack {
                    // Power Button
                    Button(action: {
                        applianceData.isOn!.toggle()
                    }) {
                        Image(systemName: "power")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .fixedSize()
                    }
                    .frame(width: 40, height: 40)
                    .background(applianceData.isOn! ? Color.white.opacity(0.6) : Color.clear)
                    .clipShape(Circle())
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
    RoomView()
}
