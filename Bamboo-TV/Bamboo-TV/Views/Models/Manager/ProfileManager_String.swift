//
//  ProfileManager.swift
//  BambooTV
//
//  Created by erick silva teran on 01/12/2020.
//

import Foundation

struct ProfileManager_String {
  
  
  private let labelListKey: String = "nameKey"
  
  
  func readProfiles() -> [String] {
    let listOfNames: [String]? = UserDefaults.standard.stringArray(forKey: labelListKey)
    return listOfNames ?? [String]()

//  para guardar avatar vamos a hacer lo siguiente:
  
//  func readProfiles() -> [Profile] {
//    if let encodedData = UserDefaults.standard.data(forKey: )
    
  }
  
  
  func saveProfiles(_ userName: String) {
    
    var listOfNames: [String] = UserDefaults.standard.stringArray(forKey: labelListKey) ?? [String]()
    
    
    listOfNames.append(userName)
    
    UserDefaults.standard.set(listOfNames, forKey: labelListKey)
    
    UserDefaults.standard.synchronize()
  }
  
  func removeProfiles(_ userName: String) {
    
    var listOfNames: [String] = UserDefaults.standard.stringArray(forKey: labelListKey) ?? [String]()
    
// el siguiente metodo elimina el usuario
//    listOfNames.removeAll(where: { $0 == userName })
    
//    el siguiente metodo elimina el primer string seleccionado unicamente , aunque hayan mas strings con el mismo nombre.
    if let index = listOfNames.firstIndex(where: { $0 == userName }) {
      listOfNames.remove(at: index)
    }
    
    UserDefaults.standard.set(listOfNames, forKey: labelListKey)
    UserDefaults.standard.synchronize()
    
  }
  
  
}

