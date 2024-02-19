//
//  CameraData.swift
//  Smart Home
//
//  Created by Kali Francia on 2/19/24.
//

import Foundation
import SwiftUI

// Demo SmartHome data for Demo purposes.
public struct CameraData {
    public func getCameraData(room: String) -> Image {
        switch room {
        case "Front Door":
            return Image("FrontdoorFootage")
        case "Garden":
            return Image("GardenFootage")
        default:
            return Image("")
        }
    }
}
