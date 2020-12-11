//
//  SelectUsers.swift
//  BambooTV
//
//  Created by erick silva teran on 01/12/2020.
//

import Foundation
import UIKit

class SelectUsers: UIViewController {
  
  private let profileManager: ProfileManager = ProfileManager()
  //  private let labelListKey: String = "nameKey"
  //  button editar usuario
  @IBAction func editarButton(_ sender: Any) {
    performSegue(withIdentifier: "goToDetail", sender: nil)
    
  }
  
  
  
  
  
  @IBAction func user1Button(_ sender: Any) {
    print("funciona")
    
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 0 {
      
      MoviesViewModel.selectedProfile = listOfNames[0]
      dismiss(animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  
  @IBOutlet weak var label1: UILabel!
  
  
  
  @IBAction func user2Button(_ sender: Any) {
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 1 {
      MoviesViewModel.selectedProfile = listOfNames[1]
      dismiss(animated: true, completion: nil)
    } else {
      
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  @IBOutlet weak var label2: UILabel!
  
  
  @IBAction func user3Button(_ sender: Any) {
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 2 {
      print("\(listOfNames[2])")
      MoviesViewModel.selectedProfile = listOfNames[2]
      dismiss(animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    
  }
  
  @IBOutlet weak var label3: UILabel!
  
  
  @IBAction func user4Button(_ sender: Any) {
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 3 {
      MoviesViewModel.selectedProfile = listOfNames[3]
      dismiss(animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
  }
  
  @IBOutlet weak var label4: UILabel!
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    for (index, profile) in profileManager.readProfiles().enumerated() {
      if index == 0 {
        label1.text = profile.name
      } else if index == 1 {
        label2.text = profile.name
      } else if index == 2 {
        label3.text = profile.name
      } else if index == 3 {
        label4.text = profile.name
      }
    }
  }
  
  
  
  
  
  
  
}
