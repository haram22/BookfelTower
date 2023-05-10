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
        VStack{
            ForEach(mockBooks) { book in
                Text(book.title)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
