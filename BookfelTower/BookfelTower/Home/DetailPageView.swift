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
        BookInfo1Vstack()
//        BookInfo2Vstack()
//        ReadingDate()
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
                    Text("000.00.00")
                    Spacer()
                    Text("종료").foregroundColor(.pink)
                    Text("000.00.00")
                }.padding(.horizontal, 20)
            }.frame(width: 350, height: 40)
        }
    }
}

struct BookInfo2Vstack: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
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
            }.foregroundColor(.pink).font(.system(size: 15)).padding(.top, 20)
        }
    }
}
