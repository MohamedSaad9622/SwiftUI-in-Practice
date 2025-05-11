//
//  SpotifyCategoryCell.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 11/05/2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    
    var title: String = ""
    var isSelected: Bool = false
    
    var body: some View {
        
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10 )
            .background(isSelected ? .spotifyGreen: .spotifyGray)
            .foregroundColor(isSelected ? .spotifyBlack : .spotifyWhite)
            .clipShape(.capsule)
            
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SpotifyCategoryCell(title: "All", isSelected: true)
            SpotifyCategoryCell(title: "Music", isSelected: false)
        }
    }
}
