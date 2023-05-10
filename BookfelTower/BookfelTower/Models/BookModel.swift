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
