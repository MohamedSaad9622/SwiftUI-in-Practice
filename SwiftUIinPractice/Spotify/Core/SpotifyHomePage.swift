//
//  SpotifyHomePage.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 10/05/2025.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomePage: View {
    
    @State var currentUser: UserModel?
    @State var selectedCategory: Category? = nil
    @State var products: [ProductModel] = []
    @State var productRows: [ProductRow] = []
    
    let columns = [
        GridItem( .flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 20, pinnedViews: .sectionHeaders){
                    Section {
                        VStack(spacing: 16) {
                            recentsSection
                                .padding(.horizontal, 16)
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                                    .padding(.horizontal, 16)
                            }
                            
                            listRows
                            
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
            let allProducts = try await DataBaseHelper().getProducts()
            products = allProducts.prefix(8).map { $0 }
            
//            var rows: [ProductRow] = []
//            let allBrands = Set(allProducts.map { $0._brand })
//
//            allBrands.forEach { brand in
////                let products = allProducts.filter { $0._brand == brand }
//                rows.append(ProductRow(title: brand.capitalized, products: products))
//            }
//
//            productRows = rows
            
            productRows = Set(allProducts.compactMap({ $0._brand })).map({ brand in
                ProductRow(title: brand, products: allProducts/*.filter({ $0._brand == brand })*/)
            })
            
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
                .padding(.leading, 8)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading, 8)
        .padding(.vertical, 24)
        .background(.spotifyBlack)
    }
    
    private var recentsSection: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(products) { product in
                SpotifyRecentsCell(imageName: product.firstImage , title: product.title)
                    .animatedTap {
                        
                    }
            }
        }
    }
    
    private func newReleaseSection(product: ProductModel) -> some View {
        return SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product._brand,
            subheadline: product.category,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
         )
    }
    
    private var listRows: some View {
        VStack(alignment: .leading, spacing: 8){
            ForEach(productRows) { row in
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ScrollView(.horizontal){
                    HStack(alignment: .top){
                        ForEach(row.products) { product in
                            ImageTitleRowCell(title: product.title, imageName: product.firstImage, imageSize: 120)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
    
}

#Preview {
    SpotifyHomePage()
}
