//
//  ViewController.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 29/10/2020.
//

import UIKit
import AVFoundation
import AVKit

class DetailVC: UIViewController {
  
  private let moviesManager: MoviesManager = MoviesManager()
  
  @IBOutlet weak var videoContainer: UIView!
  
  @IBOutlet weak var movieTitle: UILabel!
  
  @IBOutlet weak var movieCoincidence: UILabel!
  
  
  
  @IBOutlet weak var movieDate: UILabel!
  
  
  @IBOutlet weak var movieDescription: UILabel!
  
  @IBOutlet weak var movieGeneros: UILabel!
  
  
  @IBOutlet weak var movieProduced: UILabel!
  
  
  
  
  
  
  //  @IBOutlet weak var descriptionLabel: UILabel!
  
  var descriptionText: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchMovieDetails()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //    descriptionLabel.text = descriptionText
    
  }
  
  private func fetchMovieDetails() {
    guard let selectedMovieId = MoviesViewModel.selectedMovieId else { return }
    moviesManager.fetchMovieDetail(movieId: selectedMovieId) { infoDescargoApi in
      self.configureView(movieDetails: infoDescargoApi)
      
      
    }
  }
  
  private func configureView(movieDetails: MovieDetail) {
    movieTitle.text = movieDetails.title
    movieDate.text = movieDetails.releaseDate
    movieCoincidence.text = "Popularidad: \(movieDetails.popularity)"
    movieDescription.text = "Descripción: \n" + movieDetails.overview!
    movieGeneros.text = "Generos: " + movieDetails.genres.map{$0.name}.joined(separator: ", ")
    movieProduced.text = "Producido por: " + movieDetails.productionCompanies.map{$0.name}.joined(separator: ", ")
    configurePlayer(movieDetails: movieDetails)
    
////    tambien puedo llamar a configurePlayer
////    para que funcione tengo k eliminar los guard let de las funciones requeridas
//    if let videoUrl = movieDetails.videoUrl {
//      configurePlayer(movieDetails: videoUrl)
//    }else {
//      debugPrint("Error falta url invalid in \(#function)")
//    }
  }
  
  
  
  
  
  
  
  var movieUrl = Bundle.main.url(forResource: "video", withExtension: "m4v")
  
  //  self.moviePlayer = MPMoviePlayerController(contentURL: movieUrl)
  
  
  
  private func configurePlayer(movieDetails: MovieDetail) {
    
    guard let videoURL = movieDetails.videoUrl else {
      
      debugPrint("Error: video URL invalid in \(#function)")
      
      return
      
    }
    
    
    
    // Solución #2: usando AVPlayerViewController
    
    // Muestra los controles típicos de un vídeo (play, pause, pantalla completa, etc.)
    
    let player = AVPlayer(url: videoURL)
    
    let playerViewController = AVPlayerViewController()
    
    playerViewController.player = player
    
    guard let playerView = playerViewController.view else {
      
      debugPrint("Error: player view is nil")
      
      return
      
    }
    
    self.addChild(playerViewController)
    
    videoContainer.addSubview(playerView)
    
    playerViewController.didMove(toParent: self)
    
    
    
    playerView.translatesAutoresizingMaskIntoConstraints = false
    
    let topConstraint = NSLayoutConstraint(item: playerView, attribute: .top, relatedBy: .equal, toItem: videoContainer, attribute: .top, multiplier: 1, constant: 0)
    
    let bottomConstraint = NSLayoutConstraint(item: playerView, attribute: .bottom, relatedBy: .equal, toItem: videoContainer, attribute: .bottom, multiplier: 1, constant: 0)
    
    let leadingConstraint = NSLayoutConstraint(item: playerView, attribute: .leading, relatedBy: .equal, toItem: videoContainer, attribute: .leading, multiplier: 1, constant: 0)
    
    let trailingConstraint = NSLayoutConstraint(item: playerView, attribute: .trailing, relatedBy: .equal, toItem: videoContainer, attribute: .trailing, multiplier: 1, constant: 0)
    
    NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    
    player.play()
    
  }
  
}






