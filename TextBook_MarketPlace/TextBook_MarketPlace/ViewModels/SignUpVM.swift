//
//  LoginVM.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/30/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

class SignUpViewModel: ObservableObject {
    
    @Published var isLogin: Bool = false
    
    func signOutGoogle(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            isLogin.toggle()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
    }
    
    
    func getUserID() -> String {
        let firebaseAuth = Auth.auth()
        let uid = firebaseAuth.currentUser?.uid ?? "Unknown"
        return uid
    }
    
    
    func signUpWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: ApplicationUtility.rootViewController) { [unowned self] user, error in

          if let error = error {
              print(error.localizedDescription)
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)
//            Auth.auth().currentUser?.uid

            Auth.auth().signIn(with: credential) { result, error in
                
                if let err = error {
                    print(err.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print(user.displayName as Any)
                isLogin.toggle()
            }
        }
    }
}
