//
//  Article.swift
//  USNews
//
//  Created by D&C Dev on 25/08/2021.
//

import Foundation

// All Articles
struct Articles: Codable {
  let count: Int
  let all: [Article]
  
  enum CodingKeys: String, CodingKey {
    case count = "num_results"
    case all = "results"
  }
}

struct Article: Codable {
    var id: Int
    var title: String
    var subTitle: String
    var byLine: String
    var publishedDate: String
    let url: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
      case id
      case title
      case subTitle = "abstract"
      case byLine = "byline"
      case publishedDate = "published_date"
      case url
      case media
    }
}

struct Media: Codable {
    var type: String
    var subtype: String
    var all: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey {
      case type
      case subtype
      case all = "media-metadata"
    }
}

struct MediaMetaData: Codable {
    var url: String
    var format: Format?
    var height: Int
    var width: Int
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}


