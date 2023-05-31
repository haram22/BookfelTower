//
//  LibraryView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/24.
//

import SwiftUI

struct LibraryView: View{
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            HStack{
                Text("나의 서재").font(.system(size: 30)).bold()
                Spacer()
            }
            LibraryTabView().padding(.top, 20)
        }.padding(.horizontal, 20)
    }
}

enum tapLabel : String, CaseIterable {
    case allBooks = "전체"
    case doneBooks = "읽은 책"
    case readingBooks = "읽고 있는 책"
    case toReadBooks = "읽고 싶은 책"
}

struct LibraryTabView: View {

    @State private var selectedPicker: tapLabel = .allBooks
    @Namespace private var animation

    var body: some View {
        VStack {
            animateTap()
            libraryTapDetail(libraryList: selectedPicker) }
    }

    @ViewBuilder
    private func animateTap() -> some View {
        HStack {
            HStack {
                ForEach(tapLabel.allCases, id: \.self) { item in
                    VStack {
                        Text(item.rawValue)
                            .font(.system(size: 18))
                            .foregroundColor(selectedPicker == item ? .black : .gray)
                        if selectedPicker == item {
                            Capsule() // 탭뷰 텍스트 아래 검은색 바
                                .foregroundColor(.black)
                                .frame(height: 3)
                        }
                    }
                    .onTapGesture {
                        self.selectedPicker = item
                    }
                }
            }
        }
    }
}

struct libraryTapDetail: View {
    let libraryCards = generateLibraryMockBooks()
    var libraryList: tapLabel
    
    var filteredLibraryCards: [BookModel] {
        switch libraryList {
        case .allBooks:
            return libraryCards
        case .doneBooks:
            return libraryCards.filter { $0.readingStatus == .isDone }
        case .readingBooks:
            return libraryCards.filter { $0.readingStatus == .isReading }
        case .toReadBooks:
            return libraryCards.filter { $0.readingStatus == .isToRead }
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(filteredLibraryCards) { libraryCardData in
                LibraryCard(
                    title: libraryCardData.title,
                    author: libraryCardData.author,
                    pageNumber: libraryCardData.pageNumber,
                    coverUrl: libraryCardData.coverUrl,
                    description: libraryCardData.description,
                    isbn: libraryCardData.isbn,
                    publisher: libraryCardData.publisher
                )
            }
        }
    }
}

struct LibraryCard: View{
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
                    .frame(width: DeviceSize.shouldSmallSize ? 110 : 120, height: DeviceSize.shouldSmallSize ? 130 : 140)
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
    }
}







struct LibraryView_Previews: PreviewProvider {
    
    static var previews: some View {
        LibraryView()
    }
}
