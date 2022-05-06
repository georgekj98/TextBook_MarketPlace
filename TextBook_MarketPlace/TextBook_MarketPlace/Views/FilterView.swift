//
//  FilterView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/3/22.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var bookStore = FilterVM()
    @State var searchDept: String = ""
    @State var searchCode: String = ""
    var body: some View {
        
        VStack{
        TextField("Enter Dept Code", text: $searchDept)
            .textFieldStyle(.roundedBorder)
        TextField("Enter Course Code", text: $searchCode)
            .textFieldStyle(.roundedBorder)
        
        Button{
            bookStore.filterData(dept: searchDept, code: searchCode)
        } label: {
            Text("Click to search")
        }
        NavigationView{
            List(bookStore.bookList, id: \.self){ book in
                Text(book.title)
            }
            .navigationTitle("Filter for books")
//            .onAppear(){
//                bookStore.fetchAllData()
//            }
        }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
