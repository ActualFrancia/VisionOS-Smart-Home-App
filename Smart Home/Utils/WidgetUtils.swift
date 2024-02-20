//
//  ApplianceWidgetUtils.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import Foundation
import SwiftUI

public struct WidgetUtils {
    public func getSystemImage(type: String, isOn: Bool) -> some View {
        var systemImage: String
        
        switch type {
        // Camera
        case "Camera":
            systemImage = "web.camera.fill"
        // Temperature
        case "Fan":
            systemImage = "fan.fill"
        case "Standing Fan":
            systemImage = "fan.floor"
        case "Thermostat":
            systemImage =  "thermometer"
        // Lighting
        case "Ceiling Light":
            systemImage = "light.cylindrical.ceiling.fill"
        case "Floor Lamp":
            systemImage = "lamp.floor.fill"
        case "Light Strip":
            systemImage = "light.strip.2.fill"
        // Health
        case "Dehumidifier":
            systemImage = "dehumidifier.fill"
        case "Air Quality Monitor":
            systemImage = "air.purifier.fill"
        default:
            systemImage = "circle.dotted"
        }
        
        return Image(systemName: systemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(WidgetUtils().getColor(type: "Image", isOn: isOn))
            .frame(height: 50)
            .fixedSize()
    }
    
    public func getSheetImage(type: String) -> some View {
        var systemImage: String
        
        switch type {
        case "AQI":
            systemImage = "aqi.medium"
        default:
            systemImage = ""
        }
        
        return Image(systemName: systemImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .fixedSize()
    }
    
    public func getColor(type: String, isOn: Bool) -> Color {
        switch type {
        case "Camera":
            return isOn ? Color.blue.opacity(0.8) : Color.black.opacity(0.5)
        case "Image":
            return isOn ? Color.white.opacity(0.9) : Color.black.opacity(0.5)
        case "Text":
            fallthrough
        default:
            return isOn ? Color.black.opacity(0.7) : Color.white.opacity(0.8)
        }
    }
    
    func showFavorite(fav: Bool, action: @escaping () -> Void) -> some View {
        return (
            Button (action: {
                action()
            }) {
                Image(systemName: fav ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .opacity(fav ? 0.8 : 0.2)
                    .fixedSize()
            }
                .frame(width: 30, height: 30)
                .buttonStyle(.borderless)
                .clipShape(Circle())
        )
    }
    
    func powerButton(onOff: Bool, action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "power")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 23, height: 23)
                .fixedSize()
        }
        .frame(width: 40, height: 40)
        .background(onOff ? Color.white.opacity(0.6) : Color.clear)
        .clipShape(Circle())
    }
    
    func favoriteButton(fav: Bool, action: @escaping () -> Void) -> some View {
        return AnyView (
            Button(
                action: {
                    action()
                }) {
                    Image(systemName: fav ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22, height: 22)
                        .foregroundStyle(fav ? Color.red : Color.white)
                        .fixedSize()
            }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        )
    }
    
    func closeButton(action: @escaping () -> Void) -> some View {
        return AnyView (
            Button(action: {
                action()
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .fixedSize()
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
        )
    }
    
    func sheetTitle(roomName: String, applianceData: Binding<Room.Appliance>, sheetToggle: Binding<Bool>) -> some View {
        return HStack {
            // Fav Button
            WidgetUtils().favoriteButton(fav: applianceData.wrappedValue.favorite, action: {
                applianceData.favorite.wrappedValue.toggle()
            })
            
            Spacer()
            
            // Title
            Text("\(roomName) \(applianceData.wrappedValue.type!)")
                .font(.title2)
                .padding(.horizontal, 20)
            
            Spacer()
            
            // Close Button
            WidgetUtils().closeButton(action: {
                sheetToggle.wrappedValue.toggle()
            })
        }
    }
    
    // AQI Int to String
    func aqiString(aqi: Double) -> String {
        switch aqi {
        case 0...50:
            return "Good"
        case 50...100:
            return "Moderate"
        case 100...200:
            return "Unhealthy"
        default:
            return "Hazardous"
        }
    }
    
    func pmString(pm: Double) -> String {
        switch pm {
        case 0...12:
            return "Good"
        case 12...35.4:
            return "Moderate"
        case 35.4...150.4:
            return "Unhealthy"
        default:
            return "Hazardous"
        }
    }
}
