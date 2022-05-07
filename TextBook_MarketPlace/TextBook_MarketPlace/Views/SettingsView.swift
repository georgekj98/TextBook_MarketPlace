//
//  SettingsView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/30/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var signUpVM: SignUpViewModel
    @ObservedObject var bookStore = userListingVM()
    
    
    var body: some View {
        VStack {
            Button("Logout") {
                signUpVM.signOutGoogle()
            }
            .foregroundColor(.white)
            .tint(.red)
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            //            Button{
            //                signUpVM.signOutGoogle()
            //            }label: {
            //                Text("Logout")
            //            }
            //            .background(Color.red)
            //            .foregroundColor(Color.white)
            //            .padding()
            
            //            Text(signUpVM.getUserID())
            //            ScrollView() {
            //                ForEach(bookStore.bookList, id: \.self){ book in
            //                    UserCardComponent(product: book)
            //                        .listRowSeparatorTint(.white)
            //                    Divider().background(Color.red)
            //                }
            //
            //                .navigationTitle("Manage Your Listings Listings")
            //
            //                .toolbar(content: {
            //                })
            //                .onAppear(){
            //                    bookStore.fetchUserListing()            }
            //
            //            }
        }
    }
    
    
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
