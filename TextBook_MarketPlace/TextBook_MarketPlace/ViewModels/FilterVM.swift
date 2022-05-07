//
//  FilterVM.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/3/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FilterVM: ObservableObject {
    
    //    @Published var bookList: [BookModel] = testBooksData
    @Published var bookList = [BookModel]()
    
    private var db = Firestore.firestore()
    
    

    
    func filterData(dept: String, code: String) {
        
        if !dept.isEmpty && !code.isEmpty {
            db.collection("books").whereField("department", isEqualTo: dept).whereField("courseCode", isEqualTo: code).addSnapshotListener{(querySnapshot, error) in
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
                
            }} else if !dept.isEmpty  {
                db.collection("books").whereField("department", isEqualTo: dept).addSnapshotListener{(querySnapshot, error) in
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
        }
    }
//}
