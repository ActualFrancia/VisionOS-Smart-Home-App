//
//  LiveCamView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/14/24.
//

import SwiftUI

struct LiveCamView: View {
    let camera: String
    let size: String
    let onOff: Bool
    @State private var isLoading: Bool = true
    
    init(camera: String, size: String, onOff: Bool) {
        self.camera = camera
        self.size = size
        self.onOff = onOff
    }
    
    func camSize () -> (width: CGFloat, height: CGFloat, imageSize: CGFloat) {
        switch size {
        case "large":
            return (width: 500, height: 281.25, imageSize: 60)
        default:
            return (width: 20, height: 20, imageSize: 20)
        }
    }
    
    func camSelect() -> Image {
        switch camera {
        case "Front Door":
            return Image("FrontdoorFootage")
        case "Kitchen":
            return Image("KitchenFootage")
        case "Family Room":
            return Image("FamilyRoomFootage")
        default:
            return Image("")
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.black.opacity(0.3))
                .frame(width: camSize().width, height: camSize().height)
            
            if (onOff) {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: camSize().imageSize)
                } else {
                    camSelect()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: camSize().width, height: camSize().height)
                }
            } else {
                Image(systemName: "video.slash.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.white.opacity(0.9))
                    .frame(height: camSize().imageSize)
            }
        }
        // Simulate loading live camera footage on toggle camera on
        .onChange(of: onOff) {
            isLoading = true
            
            if (onOff) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
        }
        // Simulate loading live camera footage on toggle on appear
        .onAppear {
            if onOff {
                // Simulate Fetching Live Footage from Camear
                isLoading = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isLoading = false
                    }
                }
            }
        }
    }
}

#Preview {
    RoomView()
}
