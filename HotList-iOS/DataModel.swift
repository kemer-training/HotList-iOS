//
//  DataModel.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import Foundation

class DataModel: Codable{
    var feed: Feed?
}

class Feed: Codable{
    var results: [Result] = []
}

class Result: Codable{
    var name: String?
    var artistName: String?
    var artworkUrl100: String?
    var releaseDate: String?
    var kind: Kind?
    var genres: [Genre]?
    var contentAdvisoryRating: String?
}

enum Kind: String, Codable {
    case albums = "albums"
    case musicVideos = "music-videos"
    case playlists = "playlists"
    case songs = "songs"
    case podcasts = "podcasts"
    case podcastEpisodes = "podcast-episodes"
    case apps = "apps"
    case books = "books"
    case audioBooks = "audio-books"
}

class Genre: Codable{
    var name: String?
}
