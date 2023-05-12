//
//  BookfelTowerApp.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import SwiftUI

@main

struct BookfelTowerApp: App {
    let mockBooks = generateMockBooks()
    var body: some Scene {
        WindowGroup {
            DetailPageView(title: mockBooks[0].title, author: mockBooks[0].author, pageNumber: mockBooks[0].pageNumber, coverUrl: mockBooks[0].coverUrl, description: mockBooks[0].description, isbn: mockBooks[0].isbn, publisher: mockBooks[0].publisher)
        }
    }
}
