//
//  ApiBambooTV.swift
//  BambooTV
//
//  Created by erick silva teran on 02/12/2020.
//

import Foundation


enum EndPoints: String {
  
  case apiDataBase = "https://developers.themoviedb.org/3/getting-started/introduction"
  case discoverMovie = "https://developers.themoviedb.org/3/discover/movie-discover"
  case movieDetails = "https://developers.themoviedb.org/3/movies/get-movie-details"
  
  
  var url: String {
    return self.rawValue }
}

