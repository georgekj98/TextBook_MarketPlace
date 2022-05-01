//
//  ContentView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var signUpVM: SignUpViewModel
    
    var body: some View {
        NavigationView {
            if signUpVM.isLogin {
                TabControlView()
                    .environmentObject(signUpVM)
            }
            else {
                LoginView()
                    .environmentObject(signUpVM)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
