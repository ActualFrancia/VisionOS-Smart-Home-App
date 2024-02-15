//
//  FavoritesDetailView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/15/24.
//

import SwiftUI

struct FavoritesDetailView: View {
    let room: Room
    
    var body: some View {
        VStack (alignment: .leading) {
            if (room.favorites.contains("Camera") && room.favorites.count == 1) {
                // No title on cam only.
            } else {
                Text("\(room.name)")
                    .font(.title)
                Text("Temperature: \(room.temperature, specifier: "%.1f")º")
                    .font(.subheadline)
            }
            
            // Fav Widgets
            HStack {
                ForEach(room.favorites, id: \.self) { fav in
                    HStack {
                        // Placeholder Fav Loop
                        // TODO: REDO
                        if (fav == "Light") {
                            SmartApplianceWidget(title: "\(room.name) Light",
                                                 strength: room.lightStrength!,
                                                 type: "Light",
                                                 onOff: room.lightOn!
                            )
                        }
                        if (fav == "Temp") {
                            SmartApplianceWidget(title: "\(room.name) \(room.tempType!)",
                                                 strength: room.tempSetting!,
                                                 type: room.tempType!,
                                                 onOff: room.tempOn!)
                        }
                        if (fav == "Shade") {
                            SmartApplianceWidget(title: "\(room.name) Shade",
                                                 strength: 0,
                                                 type: "Shade",
                                                 onOff: room.shadeOpen!)
                        }
                        if (fav == "TV") {
                            SmartApplianceWidget(title: "\(room.name) TV",
                                                 strength: 0,
                                                 type: "TV",
                                                 onOff: room.tvOn!)
                        }
                        if (fav == "Oven") {
                            SmartApplianceWidget(title: "\(room.name) Oven",
                                                 strength: room.ovenTemp!,
                                                 type: "Oven",
                                                 onOff: room.ovenOn!)
                        }
                    }
                }
            }
            Spacer()
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

#Preview {
    FavoritesView()
}
