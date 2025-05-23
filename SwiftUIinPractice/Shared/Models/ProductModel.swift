//
//  ProductModel.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 10/05/2025.
//

import Foundation

struct ProductsModel: Codable {
    let products: [ProductModel]
    let total, skip, limit: Int
}

struct ProductModel: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Double // Double not Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand: String? // <- Optional
    let category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    var _brand: String {
        brand ?? ""
    }
    
//    var recentlyAdded: Bool = {
//        return Int.random(in: 1...4) == 1
//    }()
    
    static var mock: ProductModel {
        ProductModel(
            id: 123,
            title: "Example product title",
            description: "This is some mock product description that goes here.",
            price: 999,
            discountPercentage: 15,
            rating: 4.5,
            stock: 50,
            brand: "Apple",
            category: "Electronic Devices",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage]
        )
    }
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [ProductModel]
}
