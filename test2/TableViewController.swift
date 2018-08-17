//
//  TableViewController.swift
//  test2
//
//  Created by ADUP05 on 2018/8/1.
//  Copyright © 2018年 ADUP05. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var array = ["A","B","C","D","E","F"]
    var message = ["It is A","It is B","It is C","It is D","It is E","It is F"]
    var imges = ["icphoto","bace","facebook","good","home","instagram"]
    var checkBool = Array(repeating: false, count: 6)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return array.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellin = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellin, for: indexPath) as! CollectionViewCell
        cell.namelabel.text = array[indexPath.row]
        cell.img.image = UIImage(named: imges[indexPath.row])
        
        if checkBool[indexPath.row]{
            cell.accessoryType = .checkmark

        } else{
            cell.accessoryType = .none
        }
        
        
    
        return cell
    }
 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//                if editingStyle == .delete {
//                    // Delete the row from the data source
//                    tableView.deleteRows(at: [indexPath], with: .fade)
//                } else if editingStyle == .insert {
//                    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//                }
//    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let de = UIContextualAction(style: .destructive, title: "delete") { (action, view, deletebool) in

            self.array.remove(at: indexPath.row)
            self.message.remove(at: indexPath.row)
            self.imges.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with:.fade)
            
            deletebool(true)
        
        }
        let share = UIContextualAction(style: .normal, title: "share") { (action, view, bool) in
            
            let img  = UIImage(named: self.imges[indexPath.row])
            let view =  UIActivityViewController(activityItems: ["SHARE",img], applicationActivities: nil)
            self.present(view, animated: true, completion: nil)
            bool(true)
        }
        return UISwipeActionsConfiguration(actions: [share,de])
    }
    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle:, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
 

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let openMenu = UIAlertController(title: "Select item ", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        openMenu.addAction(cancelAction)
        let cancelHandler = {
            (action:UIAlertAction!)->Void in
            let alertmessage = UIAlertController(title: "標題", message: "這裡是內容！！", preferredStyle: .alert)
            alertmessage.addAction(UIAlertAction(title: "取消", style: .default ,handler: nil))
            self.present(alertmessage, animated: true, completion: nil)
        }
        
        
        var mTitle = "打卡 "
        if(self.checkBool[indexPath.row] == true){
           mTitle = "取消打卡"
        }else{
            var mTitle = "打卡 "

        }

        let checkAction  = UIAlertAction(title: mTitle, style: .default) { (action:UIAlertAction!) in
            let cell = tableView.cellForRow(at: indexPath)
            
            
            if(self.checkBool[indexPath.row] == true){
                cell?.accessoryType = .none
                self.checkBool[indexPath.row] = true
            }else{
                self.checkBool[indexPath.row] = false
                 cell?.accessoryType = .checkmark
            }
//            if(indexPath.row == 0){
//                cell?.accessoryType = .checkmark
//                self.checkBool[indexPath.row] = true
//
//            }else if (indexPath.row == 1){
//                cell?.accessoryType = .detailButton
//
//            }else if (indexPath.row == 2){
//                cell?.accessoryType = .checkmark
//
//
//            }else{
//                cell?.accessoryType = .detailDisclosureButton
//
//            }


        }
        openMenu.addAction(checkAction)
        
        let alertAction = UIAlertAction(title: "按我", style: .default, handler: cancelHandler)
        openMenu.addAction(alertAction)
        present(openMenu, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
