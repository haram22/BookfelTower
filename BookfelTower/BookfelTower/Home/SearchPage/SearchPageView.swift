//
//  SearchPageView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/11.
//

import SwiftUI

final class DeviceSize {
    static var shouldSmallSize: Bool {
        return UIScreen.main.bounds.width < 380
    }
}

struct SearchPageView: View{
    @State var searchBooks = generateLibraryMockBooks()
    @State var query = ""
    var body: some View{
        NavigationView{
            VStack{
                ScrollView{
                    LazyVStack(spacing: 10){
                        ForEach(searchBooks.indices, id: \.self) { index in
                            SearchCard(title: searchBooks[index].title, author: searchBooks[index].author, pageNumber:searchBooks[index].pageNumber, coverUrl: searchBooks[index].coverUrl, description: searchBooks[index].description, isbn: searchBooks[index].isbn, publisher: searchBooks[index].publisher)
                        }
                    }
                }
                BottomButton()
            }
            .navigationTitle("책 검색하기")
            .searchable(text: $query,placement: .navigationBarDrawer(displayMode: .automatic), prompt: "검색")
            
        }
        
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
        
        HStack(spacing: 0){
            AsyncImage(url: URL(string: coverUrl)) { image in image
                    .resizable()
                    .frame(width: DeviceSize.shouldSmallSize ? 100 : 110, height: DeviceSize.shouldSmallSize ? 130 : 140)
            } placeholder: {
                ProgressView()
            }
            ZStack(alignment: .leading){
                Color.gray.opacity(0.2)
                VStack(alignment: .leading){
                    Text(title)
                        .font(DeviceSize.shouldSmallSize ? .system(size: 15) : .system(size: 20))
                        .fontWeight(.bold)
                    Text(author)
                        .foregroundColor(.gray)
                        .font(DeviceSize.shouldSmallSize ? .system(size: 13) : .system(size: 17))
                        .fontWeight(.bold)
                    Text(description)
                        .padding(.top, 5)
                        .padding(.trailing, 10)
                        .foregroundColor(.gray)
                        .font(DeviceSize.shouldSmallSize ? .system(size: 10) : .system(size: 13))
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal, 20)
            }
        }
        .frame(height: DeviceSize.shouldSmallSize ? 130 : 140)
        .cornerRadius(20)
        .padding(.horizontal, DeviceSize.shouldSmallSize ? 15 : 20)
    }
}
struct BottomButton: View{
    var body: some View{
        ZStack{
            Color.gray.opacity(0.4)
            VStack(spacing: 10){
                Text("검색결과를 모두 보여드렸습니다. ☺️")
                VStack{
                    Button(action: {
                        print("add book manually")
                    }) {
                        Text("직접 책 추가하기")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .frame(height: 120)
        .padding(.bottom, 0)
    }
}
struct SearchPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchPageView()
    }
}
