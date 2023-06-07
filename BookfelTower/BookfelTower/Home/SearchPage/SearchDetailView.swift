//
//  SampleDetailView.swift
//  BookfelTower
//
//  Created by Alex Cho on 2023/05/31.
//
import SwiftUI

struct SampleDetailView: View {
    let isbn: String

    var body: some View {
        Text(isbn)
    }
}

struct SampleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SampleDetailView(isbn: "SAMPLE ISBN")
    }
}
