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
    let user_id = String(Session.instance.userId)
    var friends = [ItemsFriend]()
    
    func  loadFriendsData() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
        URLQueryItem(name: "user_ids", value:user_id),
        URLQueryItem(name: "fields", value: "bdate"),
        URLQueryItem(name: "access_token", value:access_token),
        URLQueryItem(name: "v", value: "5.101")
        ]
        let request = URLRequest(url: urlConstructor.url!)
        SessionManager.custom.request(request).responseData{
            response in
            guard let data = response.value else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendUserModel.self, from: data).response?.items
                print(friends ?? "no friends")
                
            }catch{
                print(error)
            }
        }
    }
    func loadPhotosData() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/photos.getAll"
        urlConstructor.queryItems = [
            URLQueryItem(name: "owner_id", value: "-\(user_id)"),
            URLQueryItem(name: "access_token", value:access_token),
            URLQueryItem(name: "v", value: "5.101")
        ]
        let request = URLRequest(url: urlConstructor.url!)
        SessionManager.custom.request(request).responseData{
            response in
            guard let data = response.value else {
                return
            }
            do {
                let photos = try JSONDecoder().decode(PhotoUserModel.self, from: data).response?.items
                print(photos ?? "no photos")
            }catch{
                print(error)
            }
        }
    }
    func loadGroupsData() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value:user_id),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "fields", value: "site"),
            URLQueryItem(name: "access_token", value:access_token),
            URLQueryItem(name: "v", value: "5.101")
        ]
        let request = URLRequest(url: urlConstructor.url!)
        SessionManager.custom.request(request).responseData{
            response in
            guard let data = response.value else {
                return
            }
            do {
                let groupss = try JSONDecoder().decode(GroupUserModel.self, from: data).response?.items
                print(groupss ?? "no groups")
            }catch{
                print(error)
            }
        }
    }
    func loadFriendsReturnData() {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value:user_id),
            URLQueryItem(name: "fields", value: "bdate"),
            URLQueryItem(name: "access_token", value:access_token),
            URLQueryItem(name: "v", value: "5.101")
        ]
        let request = URLRequest(url: urlConstructor.url!)
        SessionManager.custom.request(request).responseData{
            response in
            guard let data = response.value else {
                return
            }
            do {
                let friends = try JSONDecoder().decode(FriendUserModel.self, from: data).response?.items
                print(friends ?? "no friends")
            }catch{
                print(error)
            }
        }
    }
}
