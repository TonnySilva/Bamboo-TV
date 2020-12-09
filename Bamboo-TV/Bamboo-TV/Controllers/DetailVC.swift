//
//  ViewController.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 29/10/2020.
//

import UIKit

class DetailVC: UIViewController {
  
  private let moviesManager: MoviesManager = MoviesManager()
  
  
  @IBOutlet weak var movieTitle: UILabel!
  
  @IBOutlet weak var movieDate: UILabel!
  
  @IBOutlet weak var movieTemporada: UILabel!
  
  @IBOutlet weak var movieDescription: UILabel!
  
  @IBOutlet weak var movieGeneros: UILabel!
  
  
  @IBOutlet weak var movieProduced: UILabel!
  
  
  
  
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var descriptionText: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    fetchMovieDetails()
    // Do any additional setup after loading the view.
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //    descriptionLabel.text = descriptionText
    
  }
  
  private func fetchMovieDetails() {
    guard let selectedMovieId = MoviesViewModel.selectedMovieId else { return }
    moviesManager.fetchMovieDetail(movieId: selectedMovieId) { movieDetails in
      self.configureView(movieDetails: movieDetails)
      
      
    }
  }
  
  private func configureView(movieDetails: MovieDetail) {
    movieTitle.text = movieDetails.title
    
  }
}

