//
//  BookModel.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import Foundation

struct BookModel: Hashable {
    var id: String = UUID().uuidString
    var title: String
    var price: Double
    var department: String
    var courseCode: String
    
}

#if DEBUG

let testBooksData = [
    BookModel(title: "Intro to Computers", price: 35.0, department: "IT", courseCode: "332"),
    BookModel(title: "Intro to Java", price: 53.0, department: "IT", courseCode: "162"),
    BookModel(title: "Intro to ML", price: 98.0, department: "IT", courseCode: "242"),
    BookModel(title: "Intro to C++", price: 57.0, department: "IT", courseCode: "180")
]
#endif
