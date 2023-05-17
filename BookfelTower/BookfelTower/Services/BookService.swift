//
//  BookService.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/10.
//

import Foundation

class BookAPI{
    var keyword = ""
    var apiURL = ""
    let apiKey = "ttbexist50051416001"
    //검색 예제 - 서치 바에서 키워드로 검색을 할 때 사용
    //https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbexist50051416001&Query=어린왕자&QueryType=Title&MaxResults=10&start=1&SearchTarget=Book&output=js&Version=20070901
    
    //조회 예제 - 서치 결과에서 특정 책을 골랐을때 부가적인 정보 조회를 위해 사용
    //책 두깨에 필요한 페이지 정보는 조회 API를 통해 얻어 올 수 있으며 json key 는 "itemPage"이다.
    //http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbexist50051416001&itemIdType=ISBN13&ItemId=9791168126008&output=js
    
    
    func search() {
        
    }
}


