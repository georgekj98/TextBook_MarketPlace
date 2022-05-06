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
            
//            ScrollView {
                List(bookStore.bookList, id: \.self){ book in
//                    Text(book.title)
                    ProductCard(product: book)
                        .environmentObject(cartManager)
                        .listRowSeparatorTint(.red, edges: [.top, .bottom])
//                        .background(Color.black)
//                    Spacer()
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
//            }
        }
//        .background(Color.black)
        
    }
}

struct BookListingView_Previews: PreviewProvider {
    static var previews: some View {
        BookListingView()
            .preferredColorScheme(.dark)
    }
}
