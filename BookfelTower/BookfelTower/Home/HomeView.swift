//
//  HomeView.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//
import SwiftUI

struct HomeView: View {
    let mockBooks = generateMockBooks()
    
    var body: some View {
        VStack(spacing:2) {
            ForEach(mockBooks, id: \.id) { book in
                let dynamicHeight = CGFloat(Int(book.pageNumber) ?? 0) / 3
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.pink)
                        .frame(width: 180, height: dynamicHeight)
                        .offset(CGSize(width: Int.random(in: -20...20), height: 0))
                        
                    Text(book.title)
                }.frame(width: 240).foregroundColor(.white)
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
