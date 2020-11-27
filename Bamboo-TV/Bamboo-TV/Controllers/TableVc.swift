//
//  TableVc.swift
//  TabelViewNavigetor
//
//  Created by erick silva teran on 29/10/2020.
//

import UIKit

class TableVc: UITableViewController {
  
  var currentDescription: String = ""
  
  
  let items: [Item] = [Item(name: "Item cero", description: "Descripcion item cero"),
                       Item(name: "Item uno", description: "Descripcion item uno"),
                       Item(name: "Item dos", description: "Descripcion item dos"),
                       Item(name: "Item tres", description: "Descripcion item tres")]
  
  
  
  
  
//  let items: [String] = ["Item cero", "Item uno", "Item dos", "Item tres"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationController?.navigationBar.prefersLargeTitles 

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    currentDescription = items[indexPath.row].description
    
    performSegue(withIdentifier: "showDetail", sender: nil)
  }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return items.count
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)

    cell.textLabel?.text = items[indexPath.row].name
  
    return cell
  }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

   
   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
      if let destinationVC = segue.destination as? DetailVC {
        destinationVC.descriptionText = currentDescription
        
      }
      
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
