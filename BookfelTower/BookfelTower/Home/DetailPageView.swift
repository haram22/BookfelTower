//
//  DetailPageView.swift
//  BookfelTower
//
//  Created by 김하람 on 2023/05/10.
//

import SwiftUI

let mockBooks = generateMockBooks()

struct DetailPageView: View {
    var body: some View {
        ScrollView{
            BookInfo1Vstack()
            ReadingDate()
            ButtonToggle()
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView()
        
    }
}

struct BookInfo1Vstack: View{
    var body: some View{
        VStack{
            Text(mockBooks[0].title)

            AsyncImage(url: mockBooks[0].coverUrl) { image in image
                    .resizable()
                    .frame(width: 150, height: 200)
            } placeholder: {
                ProgressView()
            }

            Text("\(mockBooks[0].author) (\(mockBooks[0].pageNumber)p)")
            
            HStack{
                ForEach(0..<3, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
            }
            ZStack{
                Color(.systemPink)
                Text("읽은 책").font(.system(size: 13)).foregroundColor(.white).fontWeight(.bold)
            }.frame(width: 53, height: 25).padding(.top).padding(.bottom, 30)
            
        }
    }
}

struct ReadingDate: View{
    var body: some View{
        VStack{
            HStack{
                Text("독서 기간")
                Spacer()
                Text("001 일 동안 읽었어요")
            }.padding(.horizontal, 20)
            ZStack{
                Color.gray.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    Text("시작").foregroundColor(.pink)
                    Text("0000.00.00")
                    Spacer()
                    Text("종료").foregroundColor(.pink)
                    Text("0000.00.00")
                }.padding(.horizontal, 20)
            }.frame(width: 350, height: 40)
        }
    }
}

struct ButtonToggle: View{
    @State private var showBookInfo = true
    @State private var showMemo = false

    var body: some View {
        HStack {
            Button("책 정보") {
                    showBookInfo = true
                showMemo = false
            }
            .padding()
            .background(showBookInfo ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
            Button("메모") {
                showBookInfo = false
                showMemo = true
        }
        .padding()
        .background(showMemo ? Color.green : Color.gray)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
    .padding()
    Spacer()
    if showBookInfo {
        BookInfoView()
        } else if showMemo {
            MemoView()
        }
        Spacer()
    }
}

struct MemoView: View {
    var body: some View {
        HStack{
            Text("나의 메모")
            Spacer()
            Button("작성하기"){
                print("pressed")
            }.foregroundColor(.pink)
        }.padding(.horizontal, 20)
    }
}

struct BookInfoView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 3){
                Text("책 소개").fontWeight(.bold)
                Text(mockBooks[0].description).foregroundColor(.gray).padding(.bottom,10)
                Text("출판사").fontWeight(.bold)
                Text(mockBooks[0].publisher).foregroundColor(.gray).padding(.bottom,10)
                Text("ISBN").fontWeight(.bold)
                Text(mockBooks[0].isbn).foregroundColor(.gray).padding(.bottom,10)
                Text("페이지").fontWeight(.bold)
                Text(mockBooks[0].pageNumber).foregroundColor(.gray)
                HStack{
                    Text("책 정보 수정").underline()
                    Text("|")
                    Text("자세히 보기").underline()
                }.foregroundColor(.pink).font(.system(size: 10)).padding(.top, 10)
            }.font(.system(size: 13)).padding(.leading,20)
            Spacer()
        }
    }
}

