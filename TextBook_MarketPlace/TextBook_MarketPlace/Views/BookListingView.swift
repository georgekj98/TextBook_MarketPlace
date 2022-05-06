//
//  BookListingView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI

struct BookListingView: View {
    
    @ObservedObject var bookStore = BookListingVM()
    @StateObject var cartManager = CartManager()
    var body: some View {
        NavigationView{
            
            
            ScrollView {
                ForEach(bookStore.bookList, id: \.self){ book in
                    ProductCard(product: book)
                        .environmentObject(cartManager)
                        .listRowSeparatorTint(.red)
                    Divider().background(Color.red)
                }
                .background(Color.black)
                .navigationTitle("All Books Listing")
                .toolbar(content: {
                    NavigationLink{
                        CartView()
                            .environmentObject(cartManager)
                    }label:{
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                })
                .onAppear(){
                    bookStore.fetchAllData()
            }
            }
        }
        
    }
}

struct BookListingView_Previews: PreviewProvider {
    static var previews: some View {
        BookListingView()
            .preferredColorScheme(.dark)
    }
}
