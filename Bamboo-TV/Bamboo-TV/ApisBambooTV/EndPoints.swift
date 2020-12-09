//
//  ApiBambooTV.swift
//  BambooTV
//
//  Created by erick silva teran on 02/12/2020.
//

import Foundation


enum EndPoints: String {
  
  case movieDiscover = "https://api.themoviedb.org/3/discover/movie"
  case movieDetails = "https://api.themoviedb.org/3/movie"
  case movieCoverImage = "https://image.tmdb.org/t/p/w500"
  
  
  var url: String {
    return self.rawValue }
}

enum EndPointsParameters: String {
  case apiKey = "api_key"
  
}

