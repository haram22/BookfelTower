import SwiftUI

struct SampleDetailView: View {
    let service = BookAPIService()
    @State var query = ""
    @State var response = Response(version: "", logo: "", title: "", link: "", pubDate: "", totalResults: 0, startIndex: 0, itemsPerPage: 0, query: "", searchCategoryId: 0, searchCategoryName: "", item: nil)
    var itemDataSample = ItemData(index: 0, title: "", link: "", author: "", pubDate: "", description: "", isbn: "", isbn13: "", itemId: 0, priceSales: 0, priceStandard: 0, mallType: "", stockStatus: "", mileage: 0, cover: "", categoryId: 0, categoryName: "", publisher: "", salesPoint: 0, adult: false, fixedPrice: false, customerReviewRank: 0)
    
    let isbn: String
    @State var bookInfo: BookInfo?
    
    init(isbn: String?) {
        self.isbn = isbn ?? ""
        _query = State(initialValue: isbn ?? "")
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    if let bookInfo = bookInfo {
                        Text(bookInfo.title).fontWeight(.bold)
                        AsyncImage(url: URL(string: bookInfo.coverUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 150, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(bookInfo.author).font(.system(size: 13))
                        Divider().padding(.all, 20)
                        VStack(alignment: .leading, spacing: 15){
                            Text("책 소개").fontWeight(.bold)
                            Text(bookInfo.description).font(.system(size: 13))
                            Text("출판사").fontWeight(.bold)
                            Text(bookInfo.publisher).font(.system(size: 13))
                            Text("ISBN").fontWeight(.bold)
                            Text(isbn).font(.system(size: 13))
                            Text("페이지").fontWeight(.bold)
                            Text("페이지 불러와야 함").font(.system(size: 13))
                            Text("자세히 보기").underline().font(.system(size: 12))
                            HStack{
                                Spacer()
                                Text("도서 DB 제공: 알라딘").font(.system(size: 12)).padding(.top, 10)
                            }
                        }.padding(.horizontal, 20)
                    }
                }
            }
        }
        .onAppear {
            LookUp(isbn: query)
        }
    }
    func LookUp(isbn: String) {
            service.search(keyword: isbn) { [self] response, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let response = response {
                    DispatchQueue.main.async {
                        if let item = response.item?.first {
                            self.bookInfo = BookInfo(
                                title: item.title,
                                author: item.author,
                                coverUrl: item.cover,
                                description: item.description,
                                publisher: item.publisher
//                                itemPage: item.
                            )
                        }
                    }
                }
            }
        }
}

struct SampleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SampleDetailView(isbn: "")
    }
}

struct BookInfo {
    let title: String
    let author: String
    let coverUrl: String
    let description: String
    let publisher: String
//    let itemPage: Int
}


