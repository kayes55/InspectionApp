//
//  Location.swift
//  Inspection
//
//  Created by Kayes on 2/24/24.
//

import Foundation

struct Location: Identifiable, Hashable {
    var id = UUID()
    var city: String
    var country: String
    var image: String
}

var locations: [Location] = [
    Location(city: "New York City", country: "USA", image: "NYC"),
    Location(city: "Seattle", country: "USA", image: "Seattle"),
    Location(city: "Chicago", country: "USA", image: "Chicago"),
]
