//
//  SellBookView.swift
//  TextBook_MarketPlace
//
//  Created by George Jacob on 4/27/22.
//

import SwiftUI
import Firebase

struct SellBookView: View {
    @State var newTitle: String = ""
    @State var newPrice: String = ""
    @State var newDept: String = ""
    @State var newCourseNum: String = ""
    @ObservedObject var bookStore = BookListingVM()
    @EnvironmentObject var signUpVM: SignUpViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                //                                ZStack {
//                LinearGradient(
//                    colors: [Color.black, .red],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//                    .ignoresSafeArea(.keyboard, edges: .bottom)
//                    .ignoresSafeArea(.container, edges: [.top, .horizontal])
                
                VStack(alignment: .leading, spacing: nil){
                    
                    TextField("Enter Book Title", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Book Price", text: $newPrice)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter Department", text: $newDept)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter CourseNum", text: $newCourseNum)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        let book = BookModel(title: newTitle, price: Double(newPrice) ?? 0.0, department: newDept, courseCode: newCourseNum, userID: signUpVM.getUserID())
                        
                        bookStore.addBook(book: book)
                        
                        newTitle = ""
                        newPrice = ""
                        newDept = ""
                        newCourseNum = ""
                    }){
                        HStack{
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .leading)
                            Text("List book online")
                        }
                        .foregroundColor(.primary)
                    }
                    .padding()
                }
                .padding()
                .navigationTitle("Sell Book Online")
                .foregroundColor(.white)
                //                .foregroundColor(.primary)
            }
        }
    }
}

struct SellBookView_Previews: PreviewProvider {
    static var previews: some View {
        SellBookView()
    }
}
