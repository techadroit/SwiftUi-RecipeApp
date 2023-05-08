// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let recipeDetailResponse = try? JSONDecoder().decode(RecipeDetailResponse.self, from: jsonData)

import Foundation

// MARK: - RecipeDetailResponse
class RecipeDetailResponse: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool
    let veryHealthy, cheap, veryPopular, sustainable: Bool
    let lowFodmap: Bool
    let weightWatcherSmartPoints: Int
    let gaps: String
    let preparationMinutes, cookingMinutes, aggregateLikes, healthScore: Int
    let creditsText, sourceName: String
    let pricePerServing: Double
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes, servings: Int
    let sourceURL: String?
    let image: String
    let imageType, summary: String
    let cuisines, dishTypes, diets: [String]
    let winePairing: WinePairing
    let instructions: String
    let analyzedInstructions: [AnalyzedInstruction]
    let originalID: String?

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, lowFodmap, weightWatcherSmartPoints, gaps, preparationMinutes, cookingMinutes, aggregateLikes, healthScore, creditsText, sourceName, pricePerServing, extendedIngredients, id, title, readyInMinutes, servings
        case sourceURL
        case image, imageType, summary, cuisines, dishTypes, diets, winePairing, instructions, analyzedInstructions
        case originalID
    }

    init(vegetarian: Bool, vegan: Bool, glutenFree: Bool, dairyFree: Bool, veryHealthy: Bool, cheap: Bool, veryPopular: Bool, sustainable: Bool, lowFodmap: Bool, weightWatcherSmartPoints: Int, gaps: String, preparationMinutes: Int, cookingMinutes: Int, aggregateLikes: Int, healthScore: Int, creditsText: String, sourceName: String, pricePerServing: Double, extendedIngredients: [ExtendedIngredient], id: Int, title: String, readyInMinutes: Int, servings: Int, sourceURL: String?, image: String, imageType: String, summary: String, cuisines: [String], dishTypes: [String], diets: [String], winePairing: WinePairing, instructions: String, analyzedInstructions: [AnalyzedInstruction], originalID: String?) {
        self.vegetarian = vegetarian
        self.vegan = vegan
        self.glutenFree = glutenFree
        self.dairyFree = dairyFree
        self.veryHealthy = veryHealthy
        self.cheap = cheap
        self.veryPopular = veryPopular
        self.sustainable = sustainable
        self.lowFodmap = lowFodmap
        self.weightWatcherSmartPoints = weightWatcherSmartPoints
        self.gaps = gaps
        self.preparationMinutes = preparationMinutes
        self.cookingMinutes = cookingMinutes
        self.aggregateLikes = aggregateLikes
        self.healthScore = healthScore
        self.creditsText = creditsText
        self.sourceName = sourceName
        self.pricePerServing = pricePerServing
        self.extendedIngredients = extendedIngredients
        self.id = id
        self.title = title
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.sourceURL = sourceURL
        self.image = image
        self.imageType = imageType
        self.summary = summary
        self.cuisines = cuisines
        self.dishTypes = dishTypes
        self.diets = diets
        self.winePairing = winePairing
        self.instructions = instructions
        self.analyzedInstructions = analyzedInstructions
        self.originalID = originalID
    }
}

// MARK: - AnalyzedInstruction
class AnalyzedInstruction: Codable {
    let name: String
    let steps: [Step]

    init(name: String, steps: [Step]) {
        self.name = name
        self.steps = steps
    }
}

// MARK: - Step
class Step: Codable {
    let number: Int
    let step: String
    let ingredients: [Ingredient]
    let equipment: [JSONAny]

    init(number: Int, step: String, ingredients: [Ingredient], equipment: [JSONAny]) {
        self.number = number
        self.step = step
        self.ingredients = ingredients
        self.equipment = equipment
    }
}

// MARK: - Ingredient
class Ingredient: Codable {
    let id: Int
    let name, localizedName, image: String

    init(id: Int, name: String, localizedName: String, image: String) {
        self.id = id
        self.name = name
        self.localizedName = localizedName
        self.image = image
    }
}

// MARK: - ExtendedIngredient
class ExtendedIngredient: Codable {
    let id: Int
    let aisle, image, consistency, name: String
    let nameClean, original, originalName: String
    let amount: Double
    let unit: String
    let meta: [String]
    let measures: Measures

    init(id: Int, aisle: String, image: String, consistency: String, name: String, nameClean: String, original: String, originalName: String, amount: Double, unit: String, meta: [String], measures: Measures) {
        self.id = id
        self.aisle = aisle
        self.image = image
        self.consistency = consistency
        self.name = name
        self.nameClean = nameClean
        self.original = original
        self.originalName = originalName
        self.amount = amount
        self.unit = unit
        self.meta = meta
        self.measures = measures
    }
}

// MARK: - Measures
class Measures: Codable {
    let us, metric: Metric

    init(us: Metric, metric: Metric) {
        self.us = us
        self.metric = metric
    }
}

// MARK: - Metric
class Metric: Codable {
    let amount: Double
    let unitShort, unitLong: String

    init(amount: Double, unitShort: String, unitLong: String) {
        self.amount = amount
        self.unitShort = unitShort
        self.unitLong = unitLong
    }
}

// MARK: - WinePairing
class WinePairing: Codable {
    let pairedWines: [String]
    let pairingText: String
    let productMatches: [ProductMatch]

    init(pairedWines: [String], pairingText: String, productMatches: [ProductMatch]) {
        self.pairedWines = pairedWines
        self.pairingText = pairingText
        self.productMatches = productMatches
    }
}

// MARK: - ProductMatch
class ProductMatch: Codable {
    let id: Int
    let title, description, price: String
    let imageURL: String?
    let averageRating: Double
    let ratingCount: Int
    let score: Double
    let link: String

    enum CodingKeys: String, CodingKey {
        case id, title, description, price
        case imageURL
        case averageRating, ratingCount, score, link
    }

    init(id: Int, title: String, description: String, price: String, imageURL: String?, averageRating: Double, ratingCount: Int, score: Double, link: String) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.averageRating = averageRating
        self.ratingCount = ratingCount
        self.score = score
        self.link = link
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
