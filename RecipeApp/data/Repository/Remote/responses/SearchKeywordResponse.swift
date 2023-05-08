//
//  SearchKeywordResponse.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 02/05/23.
//

import Foundation

class SearchKeywordResponse: Codable {
    var id: Int
    var title, imageType: String

    init(id: Int, title: String, imageType: String) {
        self.id = id
        self.title = title
        self.imageType = imageType
    }
}
