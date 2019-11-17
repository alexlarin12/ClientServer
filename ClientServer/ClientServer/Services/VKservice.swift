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

   var friendsRealm = [ItemsFriendRealm]()
   var groupsRealm = [ItemsGroupRealm]()
   var usersRealm = [UserRealm]()


class VKService {
    var access_token = Session.instance.token
    var user_id = String(Session.instance.userId)
    var friends = [ItemsFriend]()
    var saveRealmData = SaveRealmData()
    
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
                for friend in friends!{
                  let friendRealm = ItemsFriendRealm(value: [friend.id, friend.firstName,friend.lastName, friend.isClosed ?? true,friend.canAccessClosed ?? true, friend.photo50,friend.online,friend.trackCode])
                  friendsRealm.append(friendRealm)
                }
               self.saveRealmData.saveFriendsData(friendsRealm)
               
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
                for group in groups ?? []{
                    let groupRealm = ItemsGroupRealm(value: [group.id, group.name,group.screenName, group.isClosed , group.type,group.isAdmin,group.isMember, group.isAdvertiser, group.site, group.photo50,group.photo100, group.photo200])
                    groupsRealm.append(groupRealm)
                }

                self.saveRealmData.saveGroupsData(groupsRealm)
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
                for i in user ?? [] {
                    let userRealm = UserRealm(value: [i.id, i.firstName, i.lastName, i.isClosed, i.canAccessClosed, i.photo50])
                    usersRealm.append(userRealm)
                }
                self.saveRealmData.saveUserData(usersRealm)
                completion(user!)
            }catch{
                print(error)
            }
        }
    }
    
}

