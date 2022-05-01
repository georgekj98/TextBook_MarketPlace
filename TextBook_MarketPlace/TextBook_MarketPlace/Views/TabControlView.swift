//
//  TabControlView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/30/22.
//

import SwiftUI

struct TabControlView: View {
    @EnvironmentObject var signUpVM: SignUpViewModel
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
            
            SettingsView()
                .environmentObject(signUpVM)
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabControlView_Previews: PreviewProvider {
    static var previews: some View {
        TabControlView()
    }
}
