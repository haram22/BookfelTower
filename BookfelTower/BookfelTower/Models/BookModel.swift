//
//  BookModel.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

struct BookModel {
    let title: String
    let coverUrl: URL
    let author: String
    let description: String
    let publisher: String
    let isbn: String
    let pageNumber: String
    let readingStatus: readStatus?
    let startDate: Date?
    let endDate: Date?
    let rating: Int
}

enum readStatus{
    case isDone
    case isReading
    case isToRead
}


// Generate mock data
func generateMockBooks() -> [BookModel] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let book1 = BookModel(
        title: "Mock Book 1",
        coverUrl: URL(string: "https://example.com/book1.jpg")!,
        author: "John Smith",
        description: "Mock description for book 1",
        publisher: "Mock Publisher",
        isbn: "9781234567890",
        pageNumber: "200",
        readingStatus: .isDone,
        startDate: dateFormatter.date(from: "2023-01-01"),
        endDate: dateFormatter.date(from: "2023-01-15"),
        rating: 4
    )
    
    let book2 = BookModel(
        title: "Mock Book 2",
        coverUrl: URL(string: "https://example.com/book2.jpg")!,
        author: "Jane Doe",
        description: "Mock description for book 2",
        publisher: "Mock Publisher",
        isbn: "9780987654321",
        pageNumber: "300",
        readingStatus: .isReading,
        startDate: dateFormatter.date(from: "2023-02-01"),
        endDate: nil,
        rating: 0
    )
    
    let book3 = BookModel(
        title: "Mock Book 3",
        coverUrl: URL(string: "https://example.com/book3.jpg")!,
        author: "David Johnson",
        description: "Mock description for book 3",
        publisher: "Mock Publisher",
        isbn: "9785432167890",
        pageNumber: "150",
        readingStatus: .isToRead,
        startDate: nil,
        endDate: nil,
        rating: 0
    )
    
    return [book1, book2, book3]
}
