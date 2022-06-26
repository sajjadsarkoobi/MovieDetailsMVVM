//
//  TrendingMovieModel.swift
//  MovieDetailsMVVM
//
//  Created by Sajjad Sarkoobi on 26.06.2022.
//

import Foundation

// MARK: - TrendingMovieModel
struct TrendingMovieModel: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let mediaType: MediaType
    let title: String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int
    let name: String?
    let originCountry: [String]?
    let originalName, firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originCountry = "origin_country"
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ko = "ko"
}
