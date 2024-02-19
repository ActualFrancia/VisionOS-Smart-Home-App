//
//  LiveCamView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/19/24.
//

import SwiftUI

struct LiveCamView: View {
    let roomName: String
    let camSize: String
    
    @State private var isLoading: Bool = true
    
    private func frameSize() -> (width: CGFloat, height: CGFloat) {
        switch camSize {
        case "page":
            return (width: 500, height: 281.25)
        default:
            return (width: 20, height: 20)
        }
    }
    
    var body: some View {
        ZStack {
            if (isLoading) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity)
            } else {
                CameraData().getCameraData(room: roomName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .onAppear() {
            // Simulate loading live camera data.
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isLoading = false
                }
            }
            
        }
    }
}

#Preview {
    RoomTabView()
}
