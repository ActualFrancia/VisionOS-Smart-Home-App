//
//  SceneView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI


struct SceneTabView: View {
    @ObservedObject private var houseData = HouseData.shared
    @ObservedObject private var sceneData = SceneData.shared
    
    private let buttonWidth:CGFloat = 300
    private let buttonHeight:CGFloat = 75
    
    private func sceneAction(sceneData: houseScene) {
        // TODO: Rewrite, Add animation on click.
        
        // Select Appliance in Scene.appliances
        sceneData.appliances.forEach { sceneAppliance in
            // For loop into rooms
            for i in houseData.smartHome.rooms.indices {
                let room = houseData.smartHome.rooms[i]
                // Checks if "All" rooms or Selected Rooms only.
                if (sceneAppliance.room == "All" || sceneAppliance.room == room.name) {
                    // Loop into room appliances to match category of appliance selected
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
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Scenes")
                .font(.largeTitle)
                .padding(.top, 16)
        
            ForEach (sceneData.scenes.indices, id:\.self) {i in
                let scene = sceneData.scenes[i]
                
                Button(action: {
                    sceneAction(sceneData: scene)
                }) {
                    HStack {
                        Image(systemName: "\(scene.image)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .fixedSize()
                        
                        VStack (alignment: .leading) {
                            Text(scene.name)
                                .font(.title2)
                            Text(scene.subtitle)
                                .font(.callout)
                        }
                        .padding(.leading, 5)
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: buttonWidth, height: buttonHeight)
                }
                .frame(width: buttonWidth, height: buttonHeight)
                .background(scene.color.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    ContentView()
}
