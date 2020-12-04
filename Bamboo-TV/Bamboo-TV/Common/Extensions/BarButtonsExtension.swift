//
//  BarButtonsExtension.swift
//  BambooTV
//
//  Created by erick silva teran on 03/12/2020.
//

import Foundation
import UIKit



extension UIBarButtonItem {
    func hide() {
        self.isEnabled = false
        self.tintColor = .clear
    }
    
    func show() {
        self.isEnabled = true
        self.tintColor = nil
    }
}
