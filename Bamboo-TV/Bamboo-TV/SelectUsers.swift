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
  
  var isEditingModeOn: Bool = false
  
  
  
  @IBAction func listoButton(_ sender: Any) {
    isEditingModeOn = false
    listoOutlet.hide()
    editarOutlet.show()
    print("button listo")
    
    
    let alert = UIAlertController(title: "Guardar Cambios?", message: nil, preferredStyle: UIAlertController.Style.alert)
    
    let action = UIAlertAction(title: "NO", style: UIAlertAction.Style.destructive, handler:
                                { action in
                                  
                                  print("No cancelo")
                                  
                                })
    alert.addAction(action)
    
    
    
    let cancelAction = UIAlertAction(title: "SI", style: UIAlertAction.Style.cancel, handler:
                                      {action in
                                        self.navigationController?.popViewController(animated: true)
                                        print("Si cancelo")
                                      })
    alert.addAction(cancelAction)
    
    self.present(alert, animated: true, completion: nil)
    
  }
  
  @IBOutlet weak var listoOutlet: UIBarButtonItem!
  
  @IBOutlet weak var editarOutlet: UIBarButtonItem!
  
  @IBAction func editAction(_ sender: UIBarButtonItem) {
    isEditingModeOn = true
      editarOutlet.hide()
      listoOutlet.show()
      print("button edit")
  }
  
  @IBOutlet weak var button1: UIButton!
  
  @IBOutlet weak var button2: UIButton!
  
  @IBOutlet weak var button3: UIButton!
  
  @IBOutlet weak var button4: UIButton!
  
  @IBAction func user1Button(_ sender: Any) {
    print("funciona")
    
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 0 {
      MoviesViewModel.selectedProfile = listOfNames[0]
      MoviesViewModel.newAvatarImageName = nil
      
      if isEditingModeOn {
        performSegue(withIdentifier: "goToDetail", sender: nil)
      } else {
        dismiss(animated: true, completion: nil)
      }
    } else {
      MoviesViewModel.selectedProfile = nil
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  
  @IBOutlet weak var label1: UILabel!
  
  @IBAction func user2Button(_ sender: Any) {
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 1 {
      MoviesViewModel.selectedProfile = listOfNames[1]
      
      MoviesViewModel.newAvatarImageName = nil
      
      if isEditingModeOn {
        performSegue(withIdentifier: "goToDetail", sender: nil)
      } else {
        dismiss(animated: true, completion: nil)
      }
      
    } else {
      MoviesViewModel.selectedProfile = nil
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
      
      MoviesViewModel.newAvatarImageName = nil
      if isEditingModeOn {
        performSegue(withIdentifier: "goToDetail", sender: nil)
      } else {
        dismiss(animated: true, completion: nil)
      }
      
    } else {
      MoviesViewModel.selectedProfile = nil
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  @IBOutlet weak var label3: UILabel!
  
  
  @IBAction func user4Button(_ sender: Any) {
    
    let listOfNames: [Profile] = profileManager.readProfiles()
    let numOfNames: Int = listOfNames.count
    
    if numOfNames > 3 {
      MoviesViewModel.selectedProfile = listOfNames[3]
      
      MoviesViewModel.newAvatarImageName = nil
      
      if isEditingModeOn {
        performSegue(withIdentifier: "goToDetail", sender: nil)
      } else {
        dismiss(animated: true, completion: nil)
      }
      
    } else {
      MoviesViewModel.selectedProfile = nil
      performSegue(withIdentifier: "goToDetail", sender: nil)
    }
  }
  
  @IBOutlet weak var label4: UILabel!
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    
    for (index, profile) in profileManager.readProfiles().enumerated() {
      if index == 0 {
        label1.text = profile.name
//        let img: UIImage? = UIImage(named: profile.imageName)
        
        button1.setImage(profile.image, for: .normal)
      } else if index == 1 {
        
        label2.text = profile.name
        button2.setImage(profile.image, for: .normal)
        
      } else if index == 2 {
        label3.text = profile.name
        button3.setImage(profile.image, for: .normal)
        
      } else if index == 3 {
        label4.text = profile.name
        button4.setImage(profile.image, for: .normal)
      }
    }
  }
}
