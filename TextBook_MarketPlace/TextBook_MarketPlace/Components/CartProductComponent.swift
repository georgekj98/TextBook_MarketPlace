//
//  CartProductComponent.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/6/22.
//

import Foundation
import SwiftUI

struct CartComponentCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: BookModel
    
    var body: some View {
        HStack {
            //            ZStack(alignment: .bottom) {
            
            VStack(alignment: .leading) {
                Text(product.title)
                //                        .bold()
                Text("\(product.department) \(product.courseCode)")
                Text("\(product.price)$")
                //                        .font(.caption)
            }
            .padding()
            .frame(width: 180, alignment: .leading)
            //                .background(.ultraThinMaterial)
            .cornerRadius(20)
            //            }
            .frame(width: 200, height: 80)
            .shadow(radius: 3)
            
            //            Button {
            //                cartManager.removeFromCart(product: product)
            //            } label: {
            Image(systemName: "minus")
                .padding(10)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(50)
                .padding()
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
            //            }
        }.ignoresSafeArea()
    }
}

struct CartComponentCard_Previews: PreviewProvider {
    static var previews: some View {
        CartComponentCard(product: BookModel(title: "Intro to WTF", price: 22, department: "IT", courseCode: "300", userID: ""))
            .preferredColorScheme(.dark)
        //            .environmentObject(CartManager())
    }
    
}
