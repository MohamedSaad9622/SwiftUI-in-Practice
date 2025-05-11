//
//  SpotifyHomePage.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 10/05/2025.
//

import SwiftUI

struct SpotifyHomePage: View {
    
    @State var currentUser: UserModel?
    @State var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 20, pinnedViews: .sectionHeaders){
                    Section {
                        ForEach(0..<20){ _ in
                            Rectangle()
                                .fill(Color.yellow)
                                .frame(height: 100)
                        }
                    } header: {
                        headerView
                    }

                }
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
//            products = try await DataBaseHelper().getProducts()
        } catch let error {
            print(error)
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 0){
            ZStack{
                if let currentUser {
                    ImageLoaderView(urlStirng: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(.circle)
                        .onTapGesture {
                            print("dkjfkdjfkdjfk")
                        }
                }
            }
            .frame(width: 40, height: 40)
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                                print(category, selectedCategory ?? "nil")
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading, 8)
        .padding(.vertical, 24)
        .background(.spotifyBlack)
    }
    
}

#Preview {
    SpotifyHomePage()
}
