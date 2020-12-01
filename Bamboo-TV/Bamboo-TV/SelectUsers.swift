//
//  SelectUsers.swift
//  BambooTV
//
//  Created by erick silva teran on 01/12/2020.
//

import Foundation
import UIKit

class SelectUsers: UIViewController {
  
  
  private let labelListKey: String = "nameKey"
  
  @IBAction func user1Button(_ sender: Any) {
    print("funciona")
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  @IBOutlet weak var label1: UILabel!
  
  
  
  @IBAction func user2Button(_ sender: Any) {
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
  @IBOutlet weak var label2: UILabel!
  
  
  @IBAction func user3Button(_ sender: Any) {
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
  @IBOutlet weak var label3: UILabel!
  
  
  @IBAction func user4Button(_ sender: Any) {
    performSegue(withIdentifier: "goToDetail", sender: nil)
  }
  
  @IBOutlet weak var label4: UILabel!
  

  
  override func viewWillAppear(_ animated: Bool) {
    if let listOfNames: [String] = UserDefaults.standard.stringArray(forKey: labelListKey) {
      for (index, name) in listOfNames.enumerated() {
        if index == 0 {
          label1.text = name
        } else if index == 1 {
          label2.text = name
        } else if index == 2 {
          label3.text = name
        } else if index == 3 {
          label4.text = name
        }
      }
    }
  }
  
  
  
  
  
  
}
