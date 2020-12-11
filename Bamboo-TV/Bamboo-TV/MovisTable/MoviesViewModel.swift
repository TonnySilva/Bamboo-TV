//
//  MoviesViewModel.swift
//  BambooTV
//
//  Created by erick silva teran on 02/12/2020.
//

import Foundation


struct MoviesViewModel {
  
  static var selectedProfile: Profile?
  static var selectedMovieId: Int?
  static var newAvatarImageName: String?
  
  static func resetSelection() {
    selectedProfile = nil
    selectedMovieId = nil
    newAvatarImageName = nil
    
  }
}
