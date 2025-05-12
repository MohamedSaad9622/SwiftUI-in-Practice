//
//  SpotifyRecentsCell.swift
//  SwiftUIinPractice
//
//  Created by Mohamed Saad on 11/05/2025.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some Random title"
    
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlStirng: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame( maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .clipShape(.buttonBorder)
    }
    
}

#Preview {
    ZStack{
        VStack{
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
}
