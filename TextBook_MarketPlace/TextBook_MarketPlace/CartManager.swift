//
//  CartManager.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/5/22.
//

import Foundation
class CartManager: ObservableObject {
    @Published private(set) var products: [BookModel] = []
    @Published private(set) var total: Double = 0
    
//     Payment-related variables
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    
    // Functions to add and remove from cart
    func addToCart(product: BookModel) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: BookModel) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    // Call the startPayment function from the PaymentHandler. In the completion handler, set the paymentSuccess variable
    func pay() {
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
}
