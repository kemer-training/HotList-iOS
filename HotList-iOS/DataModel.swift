//
//  DataModel.swift
//  HotList-iOS
//
//  Created by NAHØM on 20/02/2023.
//

import Foundation

class DataModel{
    var feed: Feed?
}

class Feed{
    var results: [Result] = []
}

class Result{
    var name: String?
    var artistName: String?
    var artworkUrl100: String?
}
