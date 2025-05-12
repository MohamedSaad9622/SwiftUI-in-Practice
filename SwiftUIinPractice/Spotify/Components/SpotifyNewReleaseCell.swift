//
//  SpotifyNewReleaseCell.swift
//  SwiftUIinPractice
//
//  Created by Mohamed Saad on 11/05/2025.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack{
                ImageLoaderView(urlStirng: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 2) {
                    if let headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundColor(.spotifyLightGray)
                    }
                       
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack  {
                ImageLoaderView(urlStirng: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundColor(.spotifyWhite)
                            
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundColor(.spotifyLightGray)
                            
                        }
                        
                    }
                    .font(.callout)
                    
                    HStack{
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundStyle(.spotifyLightGray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                        
                        Image(systemName: "play.circle.fill")
                            .font(.title)
                            .foregroundStyle(.spotifyLightGray)
                    }
                }
                .padding(.trailing, 16)
                .padding(.vertical, 16)
            }
            .themeColor(isSelected: false)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        
        SpotifyNewReleaseCell()
            .padding()
    }
}
