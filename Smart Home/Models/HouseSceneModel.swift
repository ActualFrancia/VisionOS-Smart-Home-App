//
//  HouseSceneModel.swift
//  Smart Home
//
//  Created by Kali Francia on 2/23/24.
//

import Foundation
import SwiftUI

struct houseScene: Identifiable {
    let name: String
    let subtitle: String
    let image: String
    let color: Color
    let id = UUID()
    
    // Rooms & Appliances
    var appliances: [(room: String, category: String, targetState: String, setTo: String)]
}
