//
//  TableViewCell.swift
//  BambooTV
//
//  Created by erick silva teran on 02/12/2020.
//

import UIKit
import AlamofireImage

protocol TableVcDelegate {
  func didSelectMovie(movieId: Int)
}


class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var constrain75: NSLayoutConstraint!
  
  @IBOutlet weak var constrainCuadrado: NSLayoutConstraint!
  
  @IBOutlet var buttonsCollection: [UIButton]!
  
  
  var delegate: TableVcDelegate?
  
  var circularCells: Bool = false {
    didSet {
      constrainCuadrado.isActive = circularCells
      constrain75.isActive = !circularCells
      updateButtonsFormat()
    }
  }
  
  var rowHeight: CGFloat = 0 {
    didSet {
      updateButtonsFormat()
    }
  }
  
  var movies: [Movie] = [] {
    didSet {
      updateCoverImages()
      updateButtonsIds()
    }
  }
  
  
  
  
  private func updateButtonsFormat() {
    for btn in buttonsCollection {
      let radius: CGFloat = circularCells ? rowHeight * 0.5 : 0
      btn.layer.cornerRadius = radius
      btn.clipsToBounds = true
      btn.imageView?.contentMode = .scaleAspectFill
      
    }
  }
  
  private func updateButtonsIds() {
    zip(movies, buttonsCollection).forEach { (movie, button) in
      button.tag = movie.id
      
    }
  }
  
  
  
  
  private func updateCoverImages() {
    buttonsCollection.forEach {
      $0.setImage(nil, for: .normal)
      $0.isHidden = true
    }
    zip(movies, buttonsCollection).forEach { ( movie, button) in
      if let posterPath = movie.posterPath {
        let urlToImage = EndPoints.movieCoverImage.url + posterPath
        if let url = URL(string: urlToImage) {
          button.af.setImage(for: .normal, url: url)
          button.isHidden = false
        }
      }
      
    }
    
    
  }
  
  
  @IBAction func buttonTouched(_ sender: UIButton) {
    if let delegate = delegate {
      delegate.didSelectMovie(movieId: sender.tag)
    }
  }
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
