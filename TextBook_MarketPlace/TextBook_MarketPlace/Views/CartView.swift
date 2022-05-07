//
//  CartView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/5/22.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
//    @EnvironmentObject var bookStore: BookListingVM
    var body: some View {
        //        VStack{
        //            Text("Total: $\(cartManager.total)")
        //            PaymentButton(action: cartManager.pay)
        //                .padding()
        //            NavigationView{
        //                if cartManager.paymentSuccess {
        ////                    print("Tjamls")
        //                    Text("Thank you for your purchase")
        //                        .padding()
        //                }
        //                else{
        //                    if cartManager.products.count > 0 {
        //                        ScrollView {
        //                            ForEach(cartManager.products, id: \.self){ book in
        //                                //                    Text(book.title)
        //                                CartComponentCard(product: book)
        //                                    .environmentObject(cartManager)
        //                                    .listRowSeparatorTint(.red, edges: [.top, .bottom])
        //                                //                        .background(Color.black)
        //                                //                    Spacer()
        //                            }
        //                            .background(Color.black)
        //                            .navigationTitle("Cart")
        //                        }
        //                        .onDisappear{
        //                            if cartManager.paymentSuccess {
        //                                cartManager.paymentSuccess = false
        //                            }
        //                        }
        //                    } else {
        //                        /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
        //                    }
        //                }
        //            }
        //        }
        ScrollView {
            if cartManager.paymentSuccess {
                
                Text("Thanks for your purchase!")
                    .padding()
            } else {
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        CartComponentCard(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(String(format: "%.2f", cartManager.total))")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                } else {
                    Text("Your cart is empty.")
                }
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear {
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//            .environmentObject(CartManager())
//
//    }
//}
