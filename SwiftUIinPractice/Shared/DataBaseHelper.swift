//
//  DataBaseHelper.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 10/05/2025.
//

import Foundation


struct DataBaseHelper {
    
    func getProducts() async throws -> [ProductModel] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductsModel.self, from: data)
        return products.products
    }
    
    func getUsers() async throws -> [UserModel] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UsersModel.self, from: data)
        return users.users
    }
    
}
