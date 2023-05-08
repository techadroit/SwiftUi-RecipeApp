// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videoRecipesResponse = try? JSONDecoder().decode(VideoRecipesResponse.self, from: jsonData)

import Foundation

// MARK: - VideoRecipesResponse
class VideoRecipesResponse: Codable {
    var totalResults: Int
    var videos: [VideoResponse]

    init(totalResults: Int, videos: [VideoResponse]) {
        self.totalResults = totalResults
        self.videos = videos
    }
}

// MARK: - Video
class VideoResponse: Codable {
    var title, shortTitle, youTubeID: String
    var rating: Double
    var views: Int
    var thumbnail: String
    var length: Int

    enum CodingKeys: String, CodingKey {
        case title, shortTitle
        case youTubeID = "youTubeId"
        case rating, views, thumbnail, length
    }

    init(title: String, shortTitle: String, youTubeID: String, rating: Double, views: Int, thumbnail: String, length: Int) {
        self.title = title
        self.shortTitle = shortTitle
        self.youTubeID = youTubeID
        self.rating = rating
        self.views = views
        self.thumbnail = thumbnail
        self.length = length
    }
}
@propertyWrapper public struct NilOnFail<T: Codable>: Codable {
    
    public let wrappedValue: T?
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }
    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
