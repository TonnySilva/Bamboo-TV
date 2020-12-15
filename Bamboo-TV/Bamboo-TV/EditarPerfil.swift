//
//  EditarPerfil.swift
//  BambooTV
//
//  Created by erick silva teran on 01/12/2020.
//

import Foundation
import UIKit


class EditarPerfil: UIViewController {
  
  private let profileManager: ProfileManager = ProfileManager()

  
  
  
  @IBOutlet weak var avatarEditionOutlet: UIButton!
  
  
  @IBAction func avatarEdition(_ sender: Any) {
    
    
    
    
    performSegue(withIdentifier: "goToAvatar", sender: nil)
    
  }
  
  
  
  @IBAction func cancelButton(_ sender: Any) {
    
    let alert = UIAlertController(title: "Desea cancelar?", message: nil, preferredStyle: UIAlertController.Style.alert)
    
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
  
  
  
  @IBOutlet weak var editarLabel: UITextField!
  
  @IBAction func editarLabelAction(_ sender: UITextField) {
    
    MoviesViewModel.selectedProfile?.name
    
  }
  
  
  @IBAction func eliminarButton(_ sender: UIButton) {
    
    
    let alert = UIAlertController(title: "Eliminar", message: "Desea eliminar Usuario?", preferredStyle: UIAlertController.Style.alert)
    
    
    let action = UIAlertAction(title: "Eliminar", style: UIAlertAction.Style.destructive, handler:
                                { action in
//                                  self.profileManager.removeProfiles()
                                  self.navigationController?.popViewController(animated: true)
                                  UserDefaults.standard.synchronize()
                                  print("Elimino datos")
                                  
                                })
    alert.addAction(action)
    //    no eliminar los datos con el boton NO
    let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: //nil o tmbn puedo poner prints //
                                      {action in
                                        print("No elimino los datos")
                                      })
    alert.addAction(cancelAction)
    
    self.present(alert, animated: true, completion: nil)
    
    UserDefaults.standard.synchronize()
  }
  
  
  
  
  
  @IBAction func guardarButton(_ sender: Any) {
    
    guard let nameUserNew: String = editarLabel.text else { return }
    
    let profile: Profile = Profile(name: nameUserNew, imageName: MoviesViewModel.newAvatarImageName ?? "avatar_01", id: 0)
  
    profileManager.saveProfile(profile)
    
    
   
//    var listOfNames: [String] = UserDefaults.standard.stringArray(forKey: labelListKey) ?? [String]()
//
//    listOfNames.append(fullString)
//
//    UserDefaults.standard.set(listOfNames, forKey: labelListKey)
//
//    UserDefaults.standard.synchronize()
    
    self.navigationController?.popViewController(animated: true)
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    if let imageName = MoviesViewModel.newAvatarImageName {
      avatarEditionOutlet.setImage(UIImage(named: imageName), for: .normal)
    }
    
    if let profile = MoviesViewModel.selectedProfile {
      avatarEditionOutlet.setImage(profile.image, for: .normal)
      
      editarLabel.text = profile.name
    }
    
    
  }
  
}
