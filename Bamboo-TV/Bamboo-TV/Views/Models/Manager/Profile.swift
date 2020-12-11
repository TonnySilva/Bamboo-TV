//
//  Item.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 02/11/2020.
//

import Foundation
import UIKit


struct Profile: Equatable, Codable {
    var name: String
    var imageName: String
    var id: Int
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}
