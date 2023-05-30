//
//  BookService.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

//이런식으로 API응답에 맞추어 다시 짤것. 하지만 모든 필드를 맞출 필요는 없음
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

struct ItemData: Codable {
    let title: String
    let link: String
    let author: String
    let pubDate: String
    let description: String
    let isbn: String
    let isbn13: String
    let itemId: Int
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
}



//SwiftUI 에서 비지니스 로직 어디에 태우는지?**
//Raw 한 데이터를 반환 할 것인가?
//정제된 데이터를 줄 것인가? -> 정제를 하면 테스트를 해야함
//APi는 Raww만 테스트 할 수 있는 비즈니스 로직
class BookAPIService{
    //검색 예제 - 서치 바에서 키워드로 검색을 할 때 사용
    //https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbexist50051416001&Query=어린왕자&QueryType=Title&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20070901
    
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
        
        print(url)
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
        task.resume() //이건 왜 필요하지? -> Instance를 생성후 실질적으로 실행하는것
        
    }
    
    
    //조회 예제 - 서치 결과에서 특정 책을 골랐을때 부가적인 정보 조회를 위해 사용
    //책 두깨에 필요한 페이지 정보는 조회 API를 통해 얻어 올 수 있으며 json key 는 "itemPage"이다.
    //http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbexist50051416001&itemIdType=ISBN13&ItemId=9791168126008&output=js
    
    
    // Extracts the actual JSON data from the JSONP response
    private func extractJSONData(from data: Data) throws -> Data {
        guard let jsonString = String(data: data, encoding: .utf8) else {
            throw NSError(domain: "Invalid data", code: 0, userInfo: nil)
        }

        let pattern = #"^\w+\((.*)\);$"#
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: jsonString.count)

        if let match = regex.firstMatch(in: jsonString, options: [], range: range) {
            let jsonRange = match.range(at: 1)
            let jsonSubstring = (jsonString as NSString).substring(with: jsonRange)
            if let jsonData = jsonSubstring.data(using: .utf8) {
                return jsonData
            }
        }
        //현재 여기서 에러나는 상태
        throw NSError(domain: "Invalid JSONP response", code: 0, userInfo: nil)
    }
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


