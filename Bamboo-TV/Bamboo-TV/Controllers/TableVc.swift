//
//  TableVc.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 29/10/2020.
//

import UIKit
import Alamofire





class TableVc: UITableViewController {
  
  //  crear instancia de moviesManager
  let moviesManager = MoviesManager()
  var movie: [Movie]?
  
  
//  private let namesSeccions = ["Populares", "Recientes", "Más votados", "Películas que te gustarán", "Cine internacional"]
  
  
  
  private let reuseIdentifier = String(describing: TableViewCell.self)
  
  override func viewDidLoad() {
    
    
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    
    
    super.viewDidLoad()
    fetchMovies()
    //    fetchMoviesDetail()
  }
  
  private func fetchMovies() {
    moviesManager.fetchMovies() { movieList in
      self.movie = movieList.results
      self.tableView.reloadData()
      
//      for movie in movieList.results {
//        self.moviesManager.fetchMovieDetail(movieId: String(movie.id)) {details in
//          print("==>\(details.title)")
        }
      }
      
    
  
  
  
  private func fetchMoviesDetail() {
//    moviesManager.fetchMovieDetail(movieId: "550") { movieDetails in
//      print("Details!!! \(movieDetails)")
      guard let selectedMovieId = MoviesViewModel.selectedMovieId else { return }
    moviesManager.fetchMovieDetail(movieId: selectedMovieId) { movieDetails in
      print("Details!!! \(movieDetails)")
    }
    }
  
  
  
  
  
  @IBOutlet weak var avatarButton: UIBarButtonItem!
  
  
  @IBAction func avatarItem(_ sender: Any) {
    performSegue(withIdentifier: "goToProfileSelection", sender: self)
    
  }
  
  
  
  private func goToProfileSelection() {
    performSegue(withIdentifier: "goToProfileSelection", sender: self)
  }
  
  private func showDetail() {
    performSegue(withIdentifier: "showDetail", sender: self)
  }
  
  private var profileSelectionScreenNeeded: Bool = true
  
  private func showProfileSelectionIfNeeded() {
    
    if profileSelectionScreenNeeded {
      
      goToProfileSelection()
      profileSelectionScreenNeeded = false
      
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    showProfileSelectionIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    avatarButton.title = MoviesViewModel.selectedProfile
  }
  
  
  //    override func viewDidLoad() {
  //        super.viewDidLoad()
  //
  //
  //
  //      navigationController?.navigationBar.prefersLargeTitles
  //
  //        // Uncomment the following line to preserve selection between presentations
  //        // self.clearsSelectionOnViewWillAppear = false
  //
  //        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  //        // self.navigationItem.rightBarButtonItem = self.editButtonItem
  //    }
  //
  //    // MARK: - Table view data source
  //
  //  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //
  //    currentDescription = items[indexPath.row].description
  //
  //    performSegue(withIdentifier: "showDetail", sender: nil)
  //  }
  //
  //
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return SectionType.allCases.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  //
  //
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    
    if let moviesCell = cell as? TableViewCell,
       let section: SectionType = SectionType(rawValue: indexPath.section) {
      moviesCell.rowHeight = section.rowHeight
      moviesCell.circularCells = section.isCircular
      moviesCell.movies = moviesForSection(indexPath.section)
      moviesCell.delegate = self
      
    }
    
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    guard let sectionType: SectionType = SectionType(rawValue: section) else { return "" }
    
    return sectionType.name
  }
  
  
  
  
  private func moviesForSection(_ section: Int) -> [Movie] {
    guard let allMovies = self.movie ,
          let sectionType: SectionType = SectionType(rawValue: section) else { return [] }
    
    switch sectionType {

           case .mostPopular:
               return allMovies.sorted{ $0.popularity > $1.popularity }

           case .recentlyAdded:
               return allMovies.sorted{ $0.releaseDate > $1.releaseDate }

           case .mostVoted:
               return allMovies.sorted{ $0.voteAverage > $1.voteAverage }

           case .discover:
               return allMovies.shuffled()

           case .internationalMovies:
               return allMovies.filter{ $0.originalLanguage != "en" }

           }
       }
  
  
  
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    guard let section: SectionType = SectionType(rawValue: indexPath.section) else {
      return 100
    }
    return section.rowHeight
  }
  
  //  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  //    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
  //
  //    cell.textLabel?.text = items[indexPath.row].name
  //
  //    return cell
  //  }
  //
  //    /*
  //    // Override to support conditional editing of the table view.
  //    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
  //        // Return false if you do not want the specified item to be editable.
  //        return true
  //    }
  //    */
  //
  //    /*
  //    // Override to support editing the table view.
  //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
  //        if editingStyle == .delete {
  //            // Delete the row from the data source
  //            tableView.deleteRows(at: [indexPath], with: .fade)
  //        } else if editingStyle == .insert {
  //            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  //        }
  //    }
  //    */
  //
  //    /*
  //    // Override to support rearranging the table view.
  //    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
  //
  //    }
  //    */
  //
  //    /*
  //    // Override to support conditional rearranging of the table view.
  //    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
  //        // Return false if you do not want the item to be re-orderable.
  //        return true
  //    }
  //    */
  //
  //
  //    // MARK: - Navigation
  //
  //
  //
  //    // In a storyboard-based application, you will often want to do a little preparation before navigation
  //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  //
  //      if let destinationVC = segue.destination as? DetailVC {
  //        destinationVC.descriptionText = currentDescription
  //
  //      }
  //
  //        // Get the new view controller using segue.destination.
  //        // Pass the selected object to the new view controller.
  //    }
  
  
}


// MARK: - Info for sections

extension TableVc {
  
  enum SectionType: Int, CaseIterable {
    
    case mostPopular, recentlyAdded, mostVoted, discover, internationalMovies
    
    
    
    var name: String {
      
      switch self {
      case .mostPopular:
        return "Populares"
        
      case .recentlyAdded:
        return "Recientes"
        
      case .mostVoted:
        return "Más votados"
        
      case .discover:
        return "Películas que te gustarán"
        
      case .internationalMovies:
        return "Cine internacional"
        
      }
    }
    
    
    
    var rowHeight: CGFloat {
      
      switch self {
      case .mostPopular:
        return 300.0
        
      default:
        return 150.0
        
      }
    }
    
    
    
    var isCircular: Bool {
      
      switch self {
      
      case .mostVoted:
        return true
        
      default:
        return false
        
      }
      
    }
    
  }
  
}

extension TableVc: TableVcDelegate {
  func didSelectMovie(movieId: Int) {
    print("didSelectMovie with movieId: \(movieId)")
//    MoviesViewModel
 showDetail()
    
  }
}
