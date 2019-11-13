//
//  File.swift
//  ClientServer
//
//  Created by Alex Larin on 27.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class VKService {
  
    let access_token = Session.instance.token
    let user_id = String(Session.instance.userId)
    
    func saveFriendsData(_ friends: [ItemsFriend]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
           
        } catch {
            print(error)
        }
    }
    func saveGroupsData(_ groups: [ItemsGroup]) {
       
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groups)
            try realm.commitWrite()
            
        } catch {
            print(error)
        }
    }
    func saveUserData(_ user: [User]) {
        
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(user)
            try realm.commitWrite()
            
        } catch {
            print(error)
        }
    }
    
    
    
    func  loadFriendsData(completion: @escaping ([ItemsFriend])->()) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
        URLQueryItem(name: "user_ids", value:user_id),
        URLQueryItem(name: "fields", value: "bdate"),
        URLQueryItem(name: "fields", value: "photo_50"),
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
                self.saveFriendsData(friends ?? [])
                completion(friends!)
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

    
    func loadGroupsData(completion: @escaping ([ItemsGroup])->()) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value:user_id),
        //  URLQueryItem(name: <#T##String#>, value: text),
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
                let groups = try JSONDecoder().decode(GroupUserModel.self, from: data).response?.items
                print(groups ?? "no groups")
                self.saveGroupsData(groups ?? [])
                completion(groups!)
            }catch{
                print(error)
            }
        }
    }
    func  loadUserData(completion: @escaping ([User])->()) {
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.vk.com"
        urlConstructor.path = "/method/users.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value:user_id),
            URLQueryItem(name: "fields", value: "photo_50"),
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
                let user = try JSONDecoder().decode(UserModel.self, from: data).response
                print(user ?? "no user")
                self.saveUserData(user ?? [])
                completion(user!)
            }catch{
                print(error)
            }
        }
    }
    
}

