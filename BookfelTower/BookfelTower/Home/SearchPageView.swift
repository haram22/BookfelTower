//
//  SearchPageView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/11.
//

import SwiftUI

struct SearchPageView: View{
    @State var searchBooks = generateLibraryMockBooks()
    var body: some View{
        SearchCard(title: searchBooks[0].title, author: searchBooks[0].author, pageNumber:searchBooks[0].pageNumber, coverUrl: searchBooks[0].coverUrl, description: searchBooks[0].description, isbn: searchBooks[0].isbn, publisher: searchBooks[0].publisher)
    }
}

struct SearchCard: View{
    let title: String
    let author: String
    let pageNumber: String
    let coverUrl: String
    let description: String
    let isbn: String
    let publisher: String
    
    var body: some View{
            HStack{
                AsyncImage(url: URL(string: coverUrl)) { image in image
                        .resizable()
                        .frame(width: 100, height: 150)
                } placeholder: {
                    ProgressView()
                }
                ZStack{
                    Color.gray.opacity(0.2)
                    VStack(alignment: .leading){
                        Text(title).font(.system(size: 20)).fontWeight(.bold)
                        Text(author).foregroundColor(.gray)
                        Text(description).padding(.top, 5).foregroundColor(.gray).font(.system(size: 14))
                        Spacer()
                    }.padding(.top, 10).padding(.bottom, 15).padding(.leading, 10)
                }
            }.frame(width: 370, height: 150).cornerRadius(20)
    }
}

struct SearchPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        @State var searchBooks = generateLibraryMockBooks()
        SearchCard(title: searchBooks[0].title, author: searchBooks[0].author, pageNumber:searchBooks[0].pageNumber, coverUrl: searchBooks[0].coverUrl, description: searchBooks[0].description, isbn: searchBooks[0].isbn, publisher: searchBooks[0].publisher)
    }
}
