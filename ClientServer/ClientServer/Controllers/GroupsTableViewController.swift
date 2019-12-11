//
//  GroupsTableViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 06.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    let vkService = VKService()
    let saveRealmData = SaveRealmData()
    var groups = [ItemsGroup]()
    var groupsRealm = [ItemsGroupRealm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vkService.loadGroupsData()
        saveRealmData.getGroupRealm(){[weak self] groupsRealm in
        self?.groupsRealm = groupsRealm
            self?.tableView.reloadData()
            
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsRealm.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupIdentifire", for: indexPath) as! GroupCell
        cell.GroupLabel.text = groupsRealm[indexPath.row].name
        cell.SiteGroupLabel.text = groupsRealm[indexPath.row].site

        let avatar = groupsRealm[indexPath.row].photo50
        let urlAvatar = URL(string: avatar)
        let dataAvatar = try? Data(contentsOf: urlAvatar!)
        cell.GroupImageView.image = UIImage(data: dataAvatar!)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
