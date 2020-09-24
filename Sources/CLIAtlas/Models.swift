//
//  Models.swift
//  CLIAtlas
//
//  Created by Paolo Manna on 24/09/2020.
//

import Foundation
import MongoSwiftSync

class MovieAwards: Codable {
    let nominations: Int?
    var text: String?
    let wins: Int?
}

class MovieImdb: Codable {
    var id: String?
    let rating: Double?
    let votes: Int?
}

class MovieTomato: Codable {
    var consensus: String?
    let fresh: Int?
    var image: String?
    let meter: Int?
    let rating: Double?
    let reviews: Int?
    let userMeter: Int?
    let userRating: Double?
    let userReviews: Int?
}

class MovieDetail: Codable {
    var _id: BSONObjectID?
    var _partition: String?
    let actors: [String]?
    var awards: MovieAwards?
    let countries: [String]?
    var director: String?
    let genres: [String]?
    var imdb: MovieImdb?
    let metacritic: Int?
    var plot: String?
    var poster: String?
    var rated: String?
    let runtime: Int?
    var title: String?
    var tomato: MovieTomato?
    var type: String?
    let writers: [String]?
    let year: Int?
}
