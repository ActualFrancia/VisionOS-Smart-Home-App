//
//  CameraWidget.swift
//  Smart Home
//
//  Created by Kali Francia on 2/14/24.
//

import SwiftUI

struct CameraWidget: View {
    let title: String
    let onOff: Bool
    
    @State private var isCamViewActive: Bool = false
    
    var body: some View {
        NavigationLink (destination: SingleCamView(room: title, onOff: onOff)) {
            VStack (alignment: .leading){
                VStack {
                    Image(systemName: "web.camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue.opacity(0.9))
                        .frame(height: 50)
                        .fixedSize()
                }
                
                Spacer()
                
                HStack {
                    VStack (alignment: .leading) {
                        Text(title)
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundStyle(Color.black.opacity(0.7))
                        Text("Camera")
                            .fontWeight(.bold)
                            .font(.subheadline)
                            .foregroundStyle(Color.black.opacity(0.7))
                    }
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .opacity(0.8)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.white.opacity(0.5))
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
