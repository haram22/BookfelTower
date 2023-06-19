//
//  BookService.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

struct Response: Codable{
    let version: String
    let logo: String
    let title: String
    let link: String
    let pubDate: String
    let totalResults: Int
    let startIndex: Int
    let itemsPerPage: Int
    let query: String
    let searchCategoryId: Int
    let searchCategoryName: String
    let item: [ItemData]?
}

struct ItemData: Codable, Identifiable {
    var id: Int
    let title: String
    let link: String
    let author: String
    let pubDate: String
    let description: String
    let isbn: String
    let isbn13: String
    let priceSales: Int
    let priceStandard: Int
    let mallType: String
    let stockStatus: String
    let mileage: Int
    let cover: String
    let categoryId: Int
    let categoryName: String
    let publisher: String
    let salesPoint: Int
    let adult: Bool
    let fixedPrice: Bool
    let customerReviewRank: Int
    
    //API에 이미 있는 itemId를 사용해서 id를 만들어 Identifiable 프로토콜에 따르게한다. 아마 ISBN13같은걸 사용해도 될것 같긴하다.
    enum CodingKeys: String, CodingKey {
           case id = "itemId"
           case title, link, author, pubDate, description, isbn, isbn13, priceSales, priceStandard, mallType, stockStatus, mileage, cover, categoryId, categoryName, publisher, salesPoint, adult, fixedPrice, customerReviewRank
       }

    init(index: Int, title: String, link: String, author: String, pubDate: String, description: String, isbn: String, isbn13: String, itemId: Int, priceSales: Int, priceStandard: Int, mallType: String, stockStatus: String, mileage: Int, cover: String, categoryId: Int, categoryName: String, publisher: String, salesPoint: Int, adult: Bool, fixedPrice: Bool, customerReviewRank: Int) {
            self.id = index
            self.title = title
            self.link = link
            self.author = author
            self.pubDate = pubDate
            self.description = description
            self.isbn = isbn
            self.isbn13 = isbn13
            self.priceSales = priceSales
            self.priceStandard = priceStandard
            self.mallType = mallType
            self.stockStatus = stockStatus
            self.mileage = mileage
            self.cover = cover
            self.categoryId = categoryId
            self.categoryName = categoryName
            self.publisher = publisher
            self.salesPoint = salesPoint
            self.adult = adult
            self.fixedPrice = fixedPrice
            self.customerReviewRank = customerReviewRank
        }
    
    //Decoder 프로토콜에 따르기 위해 init from decoder를 따로 정의해준다
    init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decode(Int.self, forKey: .id)
            self.title = try container.decode(String.self, forKey: .title)
            self.link = try container.decode(String.self, forKey: .link)
            self.author = try container.decode(String.self, forKey: .author)
            self.pubDate = try container.decode(String.self, forKey: .pubDate)
            self.description = try container.decode(String.self, forKey: .description)
            self.isbn = try container.decode(String.self, forKey: .isbn)
            self.isbn13 = try container.decode(String.self, forKey: .isbn13)
            self.priceSales = try container.decode(Int.self, forKey: .priceSales)
            self.priceStandard = try container.decode(Int.self, forKey: .priceStandard)
            self.mallType = try container.decode(String.self, forKey: .mallType)
            self.stockStatus = try container.decode(String.self, forKey: .stockStatus)
            self.mileage = try container.decode(Int.self, forKey: .mileage)
            self.cover = try container.decode(String.self, forKey: .cover)
            self.categoryId = try container.decode(Int.self, forKey: .categoryId)
            self.categoryName = try container.decode(String.self, forKey: .categoryName)
            self.publisher = try container.decode(String.self, forKey: .publisher)
            self.salesPoint = try container.decode(Int.self, forKey: .salesPoint)
            self.adult = try container.decode(Bool.self, forKey: .adult)
            self.fixedPrice = try container.decode(Bool.self, forKey: .fixedPrice)
            self.customerReviewRank = try container.decode(Int.self, forKey: .customerReviewRank)
        }
}

class BookAPIService{
    func search(keyword: String, completion: @escaping (Response?, Error?) -> Void) {
        let urlString = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?"
        let apiKey = "ttbexist50051416001"
        let query = keyword
        let maxResults = "10"
        let version = "20131101"
        let parameters = ["ttbkey":apiKey,"Query":query,"QueryType":"Title","MaxResults":maxResults,"start":"1","SearchTarget":"Book","output":"js","version":version]
        guard let url = URL(string: urlString)?.appendQueryParameters(parameters) else{
            fatalError("Invalid URL")
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ (data,response,error) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let response = response as? HTTPURLResponse else {
                let error = NSError(domain: "Invalid response", code: 0, userInfo: nil)
                completion(nil, error)
                return
            }
            if response.statusCode == 200{
                if let data = data{
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        completion(response,nil)
                        print(response.item?[0] ?? "default value")
                    } catch {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        
    }
    
    //TODO: 조회 예제 - 서치 결과에서 특정 책을 골랐을때 부가적인 정보 조회를 위해 사용
    //책 두깨에 필요한 페이지 정보는 조회 API를 통해 얻어 올 수 있으며 json key 는 "itemPage"이다.
    //http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbexist50051416001&itemIdType=ISBN13&ItemId=9791168126008&output=js
    
    
}

extension URL{
    func appendQueryParameters(_ parameters: [String:String]) -> URL?{
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {return nil}
        let queryItems = parameters.map{key,value in
            URLQueryItem(name: key, value: value)
        }
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
