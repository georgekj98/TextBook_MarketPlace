//
//  ProductComponent.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/5/22.
//


import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: BookModel
    
    var body: some View {
        HStack {
//            ZStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    Text(product.title)
//                        .bold()
                    Text("\(product.department) \(product.courseCode)")
                    Text("Price: $ \(String(format: "%.2f", product.price))")
//                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
//                .background(.ultraThinMaterial)
                .cornerRadius(20)
//            }
            .frame(width: 200, height: 80)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(50)
                    .padding()
            }
        }.ignoresSafeArea()
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: BookModel(title: "Intro to WTF", price: 22, department: "IT", courseCode: "300", userID: ""))
            .preferredColorScheme(.dark)
//            .environmentObject(CartManager())
    }
    
}
