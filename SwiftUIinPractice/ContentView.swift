//
//  ContentView.swift
//  SpotifyBySWiftUI
//
//  Created by Mohamed Saad on 08/05/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var products: [ProductModel] = []
    @State var users: [UserModel] = []
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(users) { user in
                    Text(user.firstName)
                }
                Text("------------------")
                ForEach(products) { product in
                    Text(product.title)
                        .foregroundStyle(.spotifyGreen)
                }
            }
            
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProducts()
        } catch let error {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
