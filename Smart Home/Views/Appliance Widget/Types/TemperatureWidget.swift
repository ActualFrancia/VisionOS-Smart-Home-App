//
//  LightWidget.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import SwiftUI

struct TemperatureWidget: View {
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
    let buttonColor = Color.blue.opacity(0.9)
    
    private func getSubtitle() -> String {
        if applianceData.isOn! {
            switch applianceData.type {
            case "Thermostat":
                return "\(applianceData.state!) • \(Int(applianceData.strength!))º"
            case "Standing Fan":
                fallthrough
            case "Fan":
                return "\(applianceData.state!) • \(Int(applianceData.strength!))%"
            default:
                return "On"
            }
        } else {
            return "Off"
        }
    }
    
    // Temperature Control
    private func getControlType() -> some View {
        switch applianceData.type {
        case "Thermostat": AnyView (
            VStack {
                HStack {
                    // Power Button
                    WidgetUtils().powerButton(onOff: applianceData.isOn!, action: {
                        applianceData.isOn!.toggle()
                    })
                    .padding(.trailing, 20)

                    Spacer()
                    
                    // Heat
                    Button(action: {
                        applianceData.state = "Heat"
                    }) {
                        Text("Heat")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(applianceData.state! == "Heat" ? Color.red.opacity(0.9) : Color.clear)
                    )
                    // Cool
                    Button(action: {
                        applianceData.state = "Cool"
                    }) {
                        Text("Cool")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(applianceData.state! == "Cool" ? Color.blue.opacity(0.9) : Color.clear)
                    )
                    // Auto
                    Button(action: {
                        applianceData.state = "Auto"
                    }) {
                        Text("Auto")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(applianceData.state! == "Auto" ? Color.white.opacity(0.6) : Color.clear)
                    )
                }
                Stepper (
                    value: $sliderValue,
                    in: -100...100,
                    step: 1
                ) {
                    Text("Temperature: \(sliderValue, specifier: "%.0f")ºC")
                }
            })
        case "Fan": AnyView (
            VStack {
                HStack {
                    // Power Button
                    WidgetUtils().powerButton(onOff: applianceData.isOn!, action: {
                        applianceData.isOn!.toggle()
                    })
                    .padding(.trailing, 20)

                    Spacer()
                    // Summer
                    Button(action: {
                        applianceData.state = "Summer"
                    }) {
                        Text("Summer")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(applianceData.state! == "Summer" ? Color.white.opacity(0.6) : Color.clear)
                    )
                    // Winter
                    Button(action: {
                        applianceData.state = "Winter"
                    }) {
                        Text("Winter")
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(applianceData.state! == "Winter" ? Color.white.opacity(0.6) : Color.clear)
                    )
                }
                
                // Slider
                HStack {
                    Text("\(sliderValue, specifier: "%.0f")%")
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(width: 40)
                    Slider(value: $sliderValue, in: 0...100)
                }
            }
        )
        default: AnyView (
            HStack {
                // Slider
                HStack {
                    Text("\(sliderValue, specifier: "%.0f")%")
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(width: 40)
                    Slider(value: $sliderValue, in: 0...100)
                }
            }
        )
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
                    WidgetUtils().showFavorite(fav: applianceData.favorite)
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
                
                // Check Temp Type
                getControlType()
                    .onChange(of: sliderValue) {
                        applianceData.strength = sliderValue.rounded()
                        if (applianceData.strength?.rounded() == 0.0) && (applianceData.type! != "Thermostat") {
                            applianceData.isOn! = false
                        } else {
                            applianceData.isOn! = true
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
