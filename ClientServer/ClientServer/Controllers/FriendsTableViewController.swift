//
//  FriendsTableViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 31.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
   let vkService = VKService()
    var friends = [ItemsFriend]()
    var saveRealmData = SaveRealmData()
    var friendsRealm = [ItemsFriendRealm]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        vkService.loadFriendsData()
        saveRealmData.getFriendRealm(){[weak self] friendsRealm in
        self?.friendsRealm = friendsRealm
        self?.tableView.reloadData()
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsRealm.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendIdentifire", for: indexPath) as! FriendCell
        cell.FriendLabel.text = friendsRealm[indexPath.row].firstName
        cell.LastNameFriendLabel.text = friendsRealm[indexPath.row].lastName
        
        let avatar = friendsRealm[indexPath.row].photo50
        let urlAvatar = URL(string: avatar)
        let dataAvatar = try? Data(contentsOf: urlAvatar!)
        cell.FriendImageView.image = UIImage(data: dataAvatar!)

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
