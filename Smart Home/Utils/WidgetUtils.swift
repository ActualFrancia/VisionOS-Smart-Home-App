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
        // Temperature
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
        // Image
        if (type == "Image") {
            return onOff ? Color.white.opacity(0.9) : Color.black.opacity(0.5)
        }
        // Text
        else {
            return onOff ? Color.black.opacity(0.7) : Color.white.opacity(0.8)
        }
    }
}
