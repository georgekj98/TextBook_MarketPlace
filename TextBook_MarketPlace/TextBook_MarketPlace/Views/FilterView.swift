//
//  FilterView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 5/3/22.
//

import SwiftUI

struct FilterView: View {
        @ObservedObject var bookStore = FilterVM()
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

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
