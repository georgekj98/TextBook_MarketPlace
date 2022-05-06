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
            ZStack {
                LinearGradient(
                    colors: [.black, .red],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                    .ignoresSafeArea(.container, edges: [.top, .horizontal])
            
//                        }
            
            
            ScrollView() {
                ForEach(bookStore.bookList, id: \.self){ book in
                    ProductCard(product: book)
//                        .background(.regularMaterial)
                        .environmentObject(cartManager)
                        .listRowSeparatorTint(.white)
                    Divider().background(Color.red)
                }
//                .background(Color.black)
                .navigationTitle("All Listings")
//                .font(.largeTitle)
//                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    NavigationLink{
                        CartView()
                            .environmentObject(cartManager)
                    }label:{
                        CartButton(numberOfProducts: cartManager.products.count)
                            .foregroundColor(Color.white)
                    }
                })
                .onAppear(){
                    bookStore.fetchAllData()
            }
//                .hiddenNavigationBarStyle()
         
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
