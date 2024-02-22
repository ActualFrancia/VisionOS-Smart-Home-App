//
//  RoomDetailView.swift
//  Smart Home
//
//  Created by Kali Francia on 2/12/24.
//

import SwiftUI

struct RoomDetailView: View {
    @Binding var room: Room
    
    var body: some View {
        VStack (alignment: .leading){
            WidgetUtils().roomTitle(room: room)
                .padding(.top, 16)
            
            // Applicance widgets
            WidgetWrapper(room: $room, favoritesOnly: false)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topLeading)
        .padding()
    }
}

#Preview {
    RoomTabView()
}
