//
//  BookService.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

struct BookData: Codable, Identifiable{
    var id: String?
    let title: String
    let coverUrl: String
    let author: String
    let description: String
    let publisher: String
    let isbn: String
    let pageNumber: String
}

struct Response: Codable {
    let documents: [BookData]
}
class BookAPIService{
    
    //검색 예제 - 서치 바에서 키워드로 검색을 할 때 사용
    //https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbexist50051416001&Query=어린왕자&QueryType=Title&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20070901
    
    func search(keyword: String, completion: @escaping ([BookData]?, Error?) -> Void) {
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
                        let jsonData = try self.extractJSONData(from: data) // Extract the actual JSON data
                        let decodedReponse = try JSONDecoder().decode(Response.self, from: jsonData)
                        let books = decodedReponse.documents
                        completion(books,nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            }            
        }
        task.resume() //이건 왜 필요하지?
        
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


