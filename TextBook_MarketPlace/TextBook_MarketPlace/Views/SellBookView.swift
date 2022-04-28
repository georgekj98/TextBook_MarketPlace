//
//  SellBookView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI

struct SellBookView: View {
    @State var newTitle: String = ""
    @State var newPrice: String = ""
    @State var newDept: String = ""
    @State var newCourseNum: String = ""
    
    var body: some View {

        NavigationView {
            VStack(alignment: .leading, spacing: nil){
    
                TextField("Enter Book Title", text: $newTitle)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter Book Price", text: $newPrice)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter Department", text: $newDept)
                    .textFieldStyle(.roundedBorder)
                TextField("Enter CourseNum", text: $newCourseNum)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {}){
                    HStack{
                    Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                    Text("List book online")
                    }
                }
                .padding()
            }
            .padding()
            .navigationTitle("Sell Book Online")
        }
    }
}

struct SellBookView_Previews: PreviewProvider {
    static var previews: some View {
        SellBookView()
    }
}
