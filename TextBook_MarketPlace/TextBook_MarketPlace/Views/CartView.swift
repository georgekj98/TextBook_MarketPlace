//
//  CartView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/5/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationView{
            //            ScrollView {
            List(cartManager.products, id: \.self){ book in
                //                    Text(book.title)
                ProductCard(product: book)
                    .environmentObject(cartManager)
                    .listRowSeparatorTint(.red, edges: [.top, .bottom])
                //                        .background(Color.black)
                //                    Spacer()
            }
            .background(Color.black)
            .navigationTitle("Cart")

        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
