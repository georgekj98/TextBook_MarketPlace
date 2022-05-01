//
//  SettingsView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/30/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var signUpVM: SignUpViewModel
    var body: some View {
        VStack {
            Button{
//                signUpVM.isLogin.toggle()
                signUpVM.signOutGoogle()
            }label: {
                Text("Logout")
            }
            .background(Color.red)
            .foregroundColor(Color.white)
            .padding()
            
            Text(signUpVM.getUserID())
        }
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
