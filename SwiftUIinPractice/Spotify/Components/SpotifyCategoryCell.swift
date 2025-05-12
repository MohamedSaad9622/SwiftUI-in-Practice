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
            .themeColor(isSelected: isSelected)
            .clipShape(.capsule)
            
    }
}

extension View {
    func themeColor(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen: .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
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
