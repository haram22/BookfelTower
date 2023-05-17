//
//  HomeView.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//
import SwiftUI

struct HomeView: View {
    let towerBooks = generateHomeMockBooks()
    let totalHeight = getHomeBooksHeight()
    let towerCharacter = "왕귤"
    let towerCharacterImageURL = "https://cdn-icons-png.flaticon.com/512/135/135620.png"
    
    @State private var query = ""
    @State private var text = ""
    
    var body: some View {
        
        NavigationView {
            VStack(){
                NavigationLink(destination: SearchPageView()){
                    HStack(){
                        Image(systemName: "magnifyingglass")
                            .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 0))
                        Text("책 검색하기")
                    }
                    Spacer()
                }
                .frame(width: 340, height: 30)
                .background(.bar)
                .cornerRadius(8)
                .padding(8)
                .foregroundColor(Color(.systemGray))
                .onTapGesture {
                    
                }
                ScrollView{
                    Spacer(minLength: 300)
                    VStack(alignment: .center, spacing:1) {
                        
                        Text("\(towerCharacter) \(totalHeight)cm")
                        AsyncImage(url: URL(string: towerCharacterImageURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        ForEach(towerBooks, id: \.id) { book in
                            let dynamicHeight = CGFloat(Int(book.pageNumber) ?? 0) / 3
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.pink)
                                    .opacity(Double.random(in: 0.5...9))
                                    .frame(width: 200, height: dynamicHeight)
                                    .offset(CGSize(width: Int.random(in: -20...20), height: 0))
                                Text(book.title)
                            }.frame(width: 300).foregroundColor(.white)
                        }
                    }.border(Color.red)
                }.border(Color.blue)
                
                
            }
        }
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
