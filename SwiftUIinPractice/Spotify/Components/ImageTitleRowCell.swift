//
//  ImageTitleRowCell.swift
//  SwiftUIinPractice
//
//  Created by Mohamed Saad on 12/05/2025.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var title: String = "Some Title"
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8){
            ImageLoaderView(urlStirng: imageName)
                .frame(width: imageSize, height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        
        Color.spotifyBlack.ignoresSafeArea(edges: .all)
        
        ImageTitleRowCell()
    }
    
}
