//
//  SceneUtils.swift
//  Smart Home
//
//  Created by Kali Francia on 2/24/24.
//

import Foundation
import SwiftUI

public struct SceneUtils {
    func sceneAction(sceneData: houseScene, houseData: HouseData) {
        // TODO: Consider Rewriting
        sceneData.appliances.forEach { sceneAppliance in
            for i in houseData.smartHome.rooms.indices {
                let room = houseData.smartHome.rooms[i]
                
                if (sceneAppliance.room == "All" || sceneAppliance.room == room.name) {
                    for j in room.appliances.indices {
                        if room.appliances[j].0 == sceneAppliance.category {
                            // Check Target Type
                            switch sceneAppliance.targetState {
                            case "strength":
                                houseData.smartHome.rooms[i].appliances[j].1.strength = Double(sceneAppliance.setTo)
                            default: // isOn
                                houseData.smartHome.rooms[i].appliances[j].1.isOn? = sceneAppliance.setTo == "On" ? true : false
                            }
                        }
                    }
                }
            }
        }
    }
    
    func sceneButton(sceneData: houseScene, houseData: HouseData) -> some View {
        let buttonWidth:CGFloat = 300
        let buttonHeight:CGFloat = 60
        
        return Button(action: {
            SceneUtils().sceneAction(sceneData: sceneData, houseData: houseData)
        }) {
            HStack {
                Image(systemName: "\(sceneData.image)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .fixedSize()
                
                VStack (alignment: .leading) {
                    Text(sceneData.name)
                        .font(.title3)
                    Text(sceneData.subtitle)
                        .font(.callout)
                }
                .padding(.leading, 5)
                
                Spacer()
            }
            .padding()
            .frame(width: buttonWidth, height: buttonHeight)
        }
        .frame(width: buttonWidth, height: buttonHeight)
        .background(Color.gray.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
