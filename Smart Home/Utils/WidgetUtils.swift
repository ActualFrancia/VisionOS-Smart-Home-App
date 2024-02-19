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
}
