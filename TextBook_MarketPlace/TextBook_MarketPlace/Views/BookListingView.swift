//
//  BookListingView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI

struct BookListingView: View {
    
    @ObservedObject var bookStore = BookListingVM()
    var body: some View {
        NavigationView{
            List(bookStore.bookList, id: \.self){ book in
                Text(book.title)
            }
            .navigationTitle("Books")
            .onAppear(){
                bookStore.fetchAllData()
            }
        }
    }
}

struct BookListingView_Previews: PreviewProvider {
    static var previews: some View {
        BookListingView()
            .preferredColorScheme(.dark)
    }
}
