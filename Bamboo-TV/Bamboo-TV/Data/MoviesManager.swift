//
//  MoviesManager.swift
//  BambooTV
//
//  Created by erick silva teran on 04/12/2020.
//

import Foundation
import Alamofire


struct MoviesManager {
  
  private let apiKeyValue: String = "d3e5f2e7aa48d158fe52cb91d420410c"
  
  func fetchMovies(success: @escaping (MovieList) -> ()){
    
    let parametres: [String : String] = [
      EndPointsParameters.apiKey.rawValue: apiKeyValue ]
    
    AF.request(EndPoints.movieDiscover.url , parameters: parametres).validate().responseDecodable(of: MovieList.self ) { (response) in
      guard let movieList: MovieList = response.value else {
        debugPrint("Error while calling \(#function)")
        self.printResponse(response)
        return }
      
      for movie in movieList.results {
        
        let movieDescription: String = "··el movie id es \(movie.id) ##con el titulo original \(movie.originalTitle)"
        
//        print(movieDescription)
//        print(movieList.totalResults)
        
      }
      success(movieList)
    }
    
    
  }
  
  func fetchMovieDetail(movieId: Int,
                                 success: @escaping (MovieDetail) -> ()) {
    
    let parametres: [String : String] = [
      EndPointsParameters.apiKey.rawValue: apiKeyValue ]
    
    let fullUrl = EndPoints.movieDetails.url + "/" + String(movieId)
    AF.request(fullUrl, parameters: parametres).validate().responseDecodable(of: MovieDetail.self) { (response) in
      
      guard let movieDetails: MovieDetail = response.value else {
        debugPrint("Error while calling \(#function)")
        self.printResponse(response)
        return
      }
      success(movieDetails)
    }
    
  }
  
  
  
  
  
  
//  Para printar el error cuando una petición falle:
  private func printResponse<T>(_ response: AFDataResponse<T>) {

          debugPrint("Request: \(String(describing: response.request))")

          debugPrint("Error: \(String(describing: response.error))")

      }
}
