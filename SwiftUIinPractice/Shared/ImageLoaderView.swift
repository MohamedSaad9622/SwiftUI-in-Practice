//
//  ImageLoaderView.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 09/05/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var urlStirng: String = Constants.randomImage
    var resizableMode: ContentMode = .fill
    
    var body: some View {
        
        Rectangle()
            .opacity(1)
            .overlay(
                WebImage(url: URL(string: urlStirng))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizableMode)
                    .allowsHitTesting(true)
            )
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(20)
        .padding(40)
        .padding(.vertical, 60)
}
