//
//  SelectAvatar.swift
//  BambooTV
//
//  Created by erick silva teran on 01/12/2020.
//

import Foundation
import UIKit


class SelectAvatar: UIViewController , UIImagePickerControllerDelegate {
  
  private let avatars: [String] = [ "avatar_01", "avatar_02", "avatar_41", "avatar_27", "avatar_16", "avatar_31" ]
  
  @IBOutlet var avatarCollection: [UIButton]!
  
  
  @IBAction func avatarButtonTouched(_ sender: UIButton) {
    if let index: Int = avatarCollection.firstIndex(of: sender),
       index < avatars.count {
      MoviesViewModel.newAvatarImageName = avatars[index]
      self.navigationController?.popViewController(animated: true)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureAvatarButtons()
  }
  
  private func configureAvatarButtons() {
//    tambien puedo implementar este for - pero swfit te da el enumereted y no hace falta poner el var i = 0
//    var i = 0
//    for btn in avatarCollection {
//      avatars[i]
//      i += 1
//    }

    for (index, btn) in avatarCollection.enumerated() {
//      print("Index: \(index)")
      if index < avatars.count {
        let img = UIImage(named: avatars[index])
        btn.setBackgroundImage(img, for: .normal)
      } else {
        print("‼️ Error: more buttons than avatars [\(#function)]")
      }
    }
  }
  
}

