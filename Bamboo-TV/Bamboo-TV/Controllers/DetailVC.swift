//
//  ViewController.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 29/10/2020.
//

import UIKit

class DetailVC: UIViewController {

  @IBOutlet weak var descriptionLabel: UILabel!
  
  var descriptionText: String = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }

  override func viewWillAppear(_ animated: Bool) {
    descriptionLabel.text = descriptionText
    
  }
  
  
}

