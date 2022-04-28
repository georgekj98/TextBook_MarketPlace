//
//  ContentView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            BookListingView()
                .tabItem{
                    Label("Buy book", systemImage: "book")
                }
            
            SellBookView()
                .tabItem{
                    Label("Sell Book", systemImage: "plus")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
