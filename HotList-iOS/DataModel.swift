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
//    var releaseDate: String?
}
