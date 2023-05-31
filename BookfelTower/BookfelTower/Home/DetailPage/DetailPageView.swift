//
//  DetailPageView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/10.
//

import SwiftUI

struct DetailPageView: View {
    enum CurrentInfo{
        case bookInfo
        case memo
    }
    @State private var currentInfo: CurrentInfo = .bookInfo
    let title: String
    let author: String
    let pageNumber: String
    let coverUrl: String
    let description: String
    let isbn: String
    let publisher: String
    let readingStatus: ReadStatus
    let currentReadingPage: Int
    let expectedScore: Int
    let startDate: Date?
    let endDate: Date?
    
    var body: some View {
        
        TopAppBar()
        ScrollView{
            LazyVStack{
                BookDetailVStack
                if readingStatus == .reading {
                    ReadingDate
                    ReadingProgress
                } else if readingStatus == .willRead{
                    ExpectedScore
                } else {
                    ReadingDate
                }
                ButtonToggle
                if currentInfo == .bookInfo {
                    HStack{
                        VStack(alignment: .leading, spacing: 3){
                            LabelInfo(title: "책 소개", subTitle: description)
                            LabelInfo(title: "출판사", subTitle: publisher)
                            LabelInfo(title: "ISBN", subTitle: isbn)
                            LabelInfo(title: "페이지", subTitle: pageNumber)
                            HStack{
                                Text("책 정보 수정")
                                    .underline()
                                Text("|")
                                Text("자세히 보기")
                                    .underline()
                            }
                            .foregroundColor(.pink)
                            .font(.system(size: 10))
                            .padding(.top, 10)
                        }
                        .font(.system(size: 13))
                        .padding(.leading,20)
                        Spacer()
                    }
                } else if currentInfo == .memo {
                    HStack{
                        Text("나의 메모")
                        Spacer()
                        Button("작성하기"){
                            print("pressed")
                        }
                        .foregroundColor(.pink)
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var BookDetailVStack: some View{
        VStack{
            Text(title).padding(.top, 10)
            AsyncImage(url: URL(string: coverUrl)) { image in image
                    .resizable()
                    .frame(width: 150, height: 200)
            } placeholder: {
                ProgressView()
            }
            Text("\(author) (\(pageNumber)p)")
            if readingStatus == .done
            {
                HStack{
                    ForEach(0..<3, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            ZStack{
                Color(.systemPink)
                Text(readingStatus == .done ? "읽은 책" : readingStatus == .reading ? "읽고 있는 책" : "읽고 싶은 책")

                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }.frame(height: 25)
                .padding(.top)
                .padding(.bottom, 30)
                .padding(.horizontal, readingStatus == .done ? 170 : 160)
        }
    }
    
    @ViewBuilder
    private var ReadingDate: some View {
        if let startDate = startDate, let endDate = endDate {
            let calendar = Calendar.current
            let startMonth = String(format: "%02d", calendar.component(.month, from: startDate))
            let startDay = String(format: "%02d", calendar.component(.day, from: startDate))
            let startYear = String(format: "%04d", calendar.component(.year, from: startDate))
            let endMonth = String(format: "%02d", calendar.component(.month, from: endDate))
            let endDay = String(format: "%02d", calendar.component(.day, from: endDate))
            let endYear = String(format: "%04d", calendar.component(.year, from: endDate))
            let readingDuration = calendar.dateComponents([.day], from: startDate, to: endDate).day ?? 0
            let today = Date()
            let currentReadingDay = Calendar.current.dateComponents([.day], from: startDate, to: today).day ?? 0

            VStack {
                HStack {
                    Text("독서 기간")
                    Spacer()
                    if readingStatus == .done {
                        Text("\(readingDuration) 일 동안 읽었어요")
                    } else if readingStatus == .reading {
                        Text("\(currentReadingDay) 일째 읽는 중")
                    }
                }
                .padding(.horizontal, 20)
                
                ZStack {
                    Color.gray.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    HStack {
                        Text("시작")
                            .foregroundColor(.pink)
                        Text("\(startYear)/\(startMonth)/\(startDay)")
                        Spacer()
                        Text("종료")
                            .foregroundColor(.pink)
                        if readingStatus == .done {
                            Text("\(endYear)/\(endMonth)/\(endDay)")
                        } else if readingStatus == .reading {
                            Text("-")
                            Spacer()
                        }
                    }
                    .font(.system(size: 12))
                    .padding(.horizontal, 20)
                }
                .frame(width: 350, height: 40)
            }
        }
    }

    
    @ViewBuilder
    private var ReadingProgress: some View{
        VStack(alignment: .leading){
            Text("독서량")
            ProgressView(value: Double(currentReadingPage), total: Double(pageNumber) ?? 0.0)
            HStack{
                Text("0").font(.system(size: 13))
                Spacer()
                Text("\(currentReadingPage)/\(pageNumber)페이지")
                    .font(.system(size: 13))
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private var ExpectedScore: some View{
        VStack(alignment: .leading){
            Text("기대점수")
            ProgressView(value: Double(expectedScore), total: 10)
            HStack{
                Text("0")
                    .font(.system(size: 13))
                Spacer()
                Text("\(expectedScore)/10점")
                    .font(.system(size: 13))
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    private var ButtonToggle: some View{
        HStack {
            Button("책 정보") {
                currentInfo = .bookInfo
            }
            .padding()
            .background(currentInfo == .bookInfo ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
            Button("메모") {
                currentInfo = .memo
            }
            .padding()
            .background(currentInfo == .memo ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        Spacer()
    }
    
    @ViewBuilder
    private func LabelInfo(title: String, subTitle: String)-> some View{
        VStack(alignment: .leading){
            Text(title)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            Text(subTitle)
                .foregroundColor(.gray)
                .padding(.bottom,10)
        }
    }
}
struct TopAppBar: View{
    var body: some View{
        ZStack{
            HStack{
                Button(action: {print("Button1")}){
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button("수정"){
                    print("수정 pressed")
                }
                Button("삭제"){
                    print("삭제 pressed")
                }
                .foregroundColor(.pink)
            }
            .padding(.horizontal, 20)
            .frame(height: 35)
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        @State var selectedBooks = generateDetailMockBook(id: "1")
        DetailPageView(title: selectedBooks.title,
                       author: selectedBooks.author,
                       pageNumber: selectedBooks.pageNumber,
                       coverUrl: selectedBooks.coverUrl,
                       description: selectedBooks.description,
                       isbn: selectedBooks.isbn,
                       publisher: selectedBooks.publisher,
                       readingStatus: selectedBooks.readingStatus ?? .willRead,
                       currentReadingPage: selectedBooks.currentReadingPage,
                       expectedScore: selectedBooks.expectScore,
                       startDate: selectedBooks.startDate!,
                       endDate: selectedBooks.endDate!)
    }
}
