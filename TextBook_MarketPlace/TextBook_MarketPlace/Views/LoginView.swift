//
//  LoginView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/30/22.
//

import SwiftUI

struct LoginView: View {
    //    @State private var logged: Bool = false
    
    @EnvironmentObject var signUpVM: SignUpViewModel
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                colors: [.black, .red],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea(.keyboard, edges: .bottom)
                .ignoresSafeArea(.container, edges: [.top, .horizontal])
            VStack{
                
                Spacer()
                Image("redbird_body")
                Spacer()
                Text("RedBird Marketplace")
                    .font(.largeTitle)
                Spacer()
                Button{
                    signUpVM.signUpWithGoogle()
                }label: {
                    HStack{
                        Text("Google Sign On")
                            .foregroundColor(.black)
                            .padding()
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .trailing)
                            .padding()
                            
                    }
                    .background(.white)
                    .padding()
                }

                Spacer()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
