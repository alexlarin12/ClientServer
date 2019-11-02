//
//  File.swift
//  ClientServer
//
//  Created by Alex Larin on 27.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import Alamofire

class VKService {
  
    let access_token = Session.instance.token
    
    func loadFriendData(){
        let paramters:Parameters = [
            "user_ids": 7143864,
            "fields" : "bdate",
            "access_token": access_token,
            "v": "5.101"
        ]
        SessionManager.custom.request("https://api.vk.com/method/friends.get", parameters: paramters).responseJSON{
            response in
            print(response.value ?? "no friends")
        }
     }

    func loadGroupsData(){
        let paramters:Parameters = [
            "user_ids" : 7143864,
            "extended" : 1,
            "fields" : "site",
            "access_token" : access_token,
            "v" : "5.101"
        ]
        SessionManager.custom.request("https://api.vk.com/method/groups.get", parameters: paramters).responseJSON{
            response in
            print(response.value ?? "no groups")
        }
     }
    
    func loadPhotosData(){
        let paramters:Parameters = [
            "owner_id" : -7143864,
            "access_token" : access_token,
            "v" : "5.101"
        ]
        
        SessionManager.custom.request("https://api.vk.com/method/photos.getAll", parameters: paramters).responseJSON {
            response in
            print(response.value ?? "no photos")
    
        }
     }
}
