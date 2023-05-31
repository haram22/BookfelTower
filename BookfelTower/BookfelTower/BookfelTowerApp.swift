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
        LibraryView()
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
        }
    }
}
