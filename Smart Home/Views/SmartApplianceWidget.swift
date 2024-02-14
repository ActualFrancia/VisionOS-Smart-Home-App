//
//  DetailBox.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct SmartApplianceWidget: View {
    let title: String
    let strength: Double
    let type: String
    var onOff: Bool
    
    @State private var localOnOff: Bool
    
    init(title: String, strength: Double, type: String, onOff: Bool) {
        self.title = title
        self.strength = strength
        self.type = type
        self.onOff = onOff
        _localOnOff = State(initialValue: onOff)
    }
    
    private func getImageColor() -> Color {
        return localOnOff ? Color.white.opacity(0.9) : Color.black.opacity(0.5)
    }
    
    private func getTextColor() -> Color {
        return localOnOff ? Color.black.opacity(0.7) : Color.white.opacity(0.8)
    }
    
    private func getBackgroundColor() -> Color {
        if (localOnOff == false) {
            return Color.gray.opacity(0.3)
        } else {
            switch type {
            case "Light":
                return Color.yellow.opacity(0.9)
            case "Fan":
                fallthrough
            case "Thermometer":
                return Color.blue.opacity(0.9)
            case "Shade":
                return Color.gray.opacity(0.9)
            case "TV":
                return Color.black.opacity(0.6)
            case "Oven":
                return Color.orange.opacity(0.9)
            default:
                return Color.white
            }
        }
    }
    
    private func getSubtitle() -> String {
        if (localOnOff) {
            switch type {
            case "Light":
                fallthrough
            case "Fan":
                return "On • \(Int(strength))%"
            case "Thermometer":
                return  "Auto • \(strength)º"
            case "Shade" :
                return "Open"
            case "Oven":
                return "Bake • \(Int(strength))º"
            default:
                return "On"
            }
        } else {
            switch type {
            case "Shade":
                return "Closed"
            default:
                return "Off"
            }
        }
    }
    
    private func getSystemImage() -> Image {
        switch type {
        case "Light":
            return Image(systemName: "lightbulb.fill")
        case "Fan":
            return Image(systemName: "fan.fill")
        case "Thermometer":
            return Image(systemName: "thermometer")
        case "Shade":
            if (localOnOff) {
                return Image(systemName: "roller.shade.open")
            } else {
                return Image(systemName: "roller.shade.closed")
            }
        case "TV":
             return Image(systemName: "tv")
        case "Oven":
            return Image(systemName: "oven.fill")
        default:
            return Image(systemName: "circle.dotted")
        }
    }
    
    private func localSwitch() {
        localOnOff.toggle()
    }

    var body: some View {
        Button(action: {
            // Update RoomData
            localSwitch()
        }) {
            VStack (alignment: .leading){
                VStack {
                    getSystemImage()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(getImageColor())
                        .frame(height: 50)
                        .fixedSize()
                }
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text(title)
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundStyle(getTextColor())
                        Text(getSubtitle())
                            .font(.caption)
                            .foregroundColor(getTextColor())
                    }
                    
                    Spacer()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(getBackgroundColor())
            )
            .frame(width: 145, height: 145)
        }
        .buttonBorderShape(.roundedRectangle(radius: 25))
        .frame(width: 145, height: 145)
    }
}

#Preview {
    RoomView()
}
