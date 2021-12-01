// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Node: Codable {
    let version: Double
    let generator: String
    let osm3S: Osm3S
    let elements: [Element]

    enum CodingKeys: String, CodingKey {
        case version, generator
        case osm3S = "osm3s"
        case elements
    }
}

// MARK: - Element
struct Element: Codable {
    let type: TypeEnum
    let id: Int
    let lat, lon: Double?
    let tags: Tags?
    let nodes: [Int]?
}

// MARK: - Tags
struct Tags: Codable {
    let barrier, bicycle, foot, crossing: String?
    let highway, lanes, maxspeed, oneway: String?
    let surface: String?
}

enum TypeEnum: String, Codable {
    case node = "node"
    case way = "way"
}

// MARK: - Osm3S
struct Osm3S: Codable {
    let timestampOsmBase: String
    let copyright: String

    enum CodingKeys: String, CodingKey {
        case timestampOsmBase = "timestamp_osm_base"
        case copyright
    }
}
