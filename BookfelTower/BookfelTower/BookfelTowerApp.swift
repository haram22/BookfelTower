//
//  BookfelTowerApp.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import SwiftUI

@main

struct BookfelTowerApp: App {
    let selectedBooks = generateDetailMockBook(id: "1")
    
    var body: some Scene {
        WindowGroup {
//        LibraryView()
//            DetailPageView(title: selectedBooks.title,
//                           author: selectedBooks.author,
//                           pageNumber: selectedBooks.pageNumber,
//                           coverUrl: selectedBooks.coverUrl,
//                           description: selectedBooks.description,
//                           isbn: selectedBooks.isbn,
//                           publisher: selectedBooks.publisher,
//                           readingStatus: selectedBooks.readingStatus ?? .isToRead,
//                           currentReadingPage: selectedBooks.currentReadingPage,
//                           expectedScore: selectedBooks.expectScore,
//                           startDate: selectedBooks.startDate ?? Date(),
//                           endDate: selectedBooks.endDate ?? Date())
            HomeView()
//            SearchPageView(response: <#Response#>)
//            DetailPageView(title: mockBooks[0].title, author: mockBooks[0].author, pageNumber: mockBooks[0].pageNumber, coverUrl: mockBooks[0].coverUrl, description: mockBooks[0].description, isbn: mockBooks[0].isbn, publisher: mockBooks[0].publisher)
        }
    }
}
