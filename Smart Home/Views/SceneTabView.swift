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

    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Scenes")
                .font(.largeTitle)
                .padding(.top, 16)
        
            ForEach (sceneData.scenes.indices, id:\.self) {i in
                SceneUtils().sceneButton(sceneData: sceneData.scenes[i], houseData: houseData)
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
