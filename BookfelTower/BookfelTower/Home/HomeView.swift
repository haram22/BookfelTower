//
//  HomeView.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//
import SwiftUI

struct HomeView: View {
    let towerBooks = generateLibraryMockBooks()
    let totalHeight = 65
    let towerCharacter = "왕귤"
    let towerCharacterImageURL = "https://cdn-icons-png.flaticon.com/512/135/135620.png"
    
    var body: some View {
        VStack(spacing:1) {
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
                        .opacity(Double.random(in: 0.6...0.9))
                        .frame(width: 200, height: dynamicHeight)
                        .offset(CGSize(width: Int.random(in: -20...20), height: 0))
                    Text(book.title)
                }.frame(width: 300).foregroundColor(.white)
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
