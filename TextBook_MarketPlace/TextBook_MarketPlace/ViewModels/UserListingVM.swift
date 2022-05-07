//
//  UserListingVM.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/6/22.
//

import Foundation
import FirebaseFirestore

class userListingVM: ObservableObject {
    
//    @EnvironmentObject var signUpVM: SignUpViewModel
    @Published var bookList = [BookModel]()
    @Published var userID: String = ""
    
    
    private var db = Firestore.firestore()
    
    
    func fetchUserListing() {
        db.collection("books").whereField("userID", isEqualTo: "CS").addSnapshotListener{(querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.bookList = documents.map{ (QueryDocumentSnapshot) -> BookModel in
                let data = QueryDocumentSnapshot.data()
                
                let title = data["title"] as? String ?? ""
                let price = data["price"] as? Double ?? 0.0
                let department = data["department"] as? String ?? ""
                let courseCode = data["courseCode"] as? String ?? ""
                let userID = data["userID"] as? String ?? ""
                
                
                return BookModel(id: .init(), title: title, price: price, department: department, courseCode: courseCode, userID: userID)
                
            }
            
            
            
        }
    }
    
    func removeListing(book: BookModel) {
        
        db.collection("books").document(book.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
}
