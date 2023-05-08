//
//  VideoRecipeItem.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 09/01/23.
//

import Foundation

class VideoRecipeItem: Identifiable{
    let title:String
    let youtubeId:String
    let thumbnail:String
    init(title: String, youtubeId: String, thumbnail: String) {
        self.title = title
        self.youtubeId = youtubeId
        self.thumbnail = thumbnail
    }
}
