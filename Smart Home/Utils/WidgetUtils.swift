//
//  ApplianceWidgetUtils.swift
//  Smart Home
//
//  Created by Kali Francia on 2/18/24.
//

import Foundation
import SwiftUI

public struct WidgetUtils {
    public func getSystemImage(type: String) -> Image {
        switch type {
        // Camera
        case "Camera":
            return Image(systemName: "web.camera.fill")
        // Temperature
        case "Fan":
            return Image(systemName: "fan.fill")
        case "Standing Fan":
            return Image(systemName: "fan.floor")
        case "Thermostat":
            return Image(systemName: "thermometer")
        // Lighting
        case "Ceiling Light":
            return Image(systemName: "light.cylindrical.ceiling.fill")
        case "Floor Lamp":
            return Image(systemName: "lamp.floor.fill")
        case "Light Strip":
            return Image(systemName: "light.strip.2.fill")
        default:
            return Image(systemName: "circle.dotted")
        }
    }
    
    public func getColor(type: String, onOff: Bool) -> Color {        
        switch type {
        case "Camera":
            return onOff ? Color.blue.opacity(0.8) : Color.black.opacity(0.5)
        case "Image":
            return onOff ? Color.white.opacity(0.9) : Color.black.opacity(0.5)
        case "Text":
            fallthrough
        default:
            return onOff ? Color.black.opacity(0.7) : Color.white.opacity(0.8)
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
}
