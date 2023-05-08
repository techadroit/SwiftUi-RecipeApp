//
//  RecipeWithCuisineResponse.swift
//  SwiftUIRecipeApp
//
//  Created by Nadar, Devasahayam on 14/03/22.
//

import Foundation

// MARK: - RecipeWithCuisineResponse
struct RecipeWithCuisineResponse: Codable {
    let results: [Result]
    let baseURI: String
    let offset, number, totalResults, processingTimeMS: Int
    let expires: Int
    let isStale: Bool?

    enum CodingKeys: String, CodingKey {
        case results = "results"
        case baseURI = "baseUri"
        case offset = "offset"
        case number = "number"
        case totalResults = "totalResults"
        case processingTimeMS = "processingTimeMs"
        case expires = "expires"
        case isStale = "isStale"
    }
}

// MARK: - Result
struct Result: Codable,Identifiable {
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case readyInMinutes = "readyInMinutes"
        case servings = "servings"
        case sourceURL = "sourceUrl"
        case image = "image"
    }
}
