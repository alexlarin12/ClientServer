//
//  SaveRealmData.swift
//  ClientServer
//
//  Created by Alex Larin on 17.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift

class SaveRealmData{
    var friendRealm = ItemsFriendRealm()
    var friendsRealm = [ItemsFriendRealm]()
    var groupsRealm = [ItemsGroupRealm]()
    var userRealm = [UserRealm]()
    var dataSessionRealm = [DataSession]()
   
    //friends
    func saveSessionData(_ dataSession: DataSession){
        do {
            let realm = try Realm()
            let oldData = realm.objects(DataSession.self)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(dataSession)
            try realm.commitWrite()
       } catch {
           print(error)
       }
    }
    func getDataSession(completion: @escaping ([DataSession]) -> () ){
        do{
            let realm = try Realm()
            let dataSessionFromRealm = realm.objects(DataSession.self)
            self.dataSessionRealm = Array(dataSessionFromRealm)
            completion(self.dataSessionRealm)
        }catch{
            print(error)
        }
    }
    func saveFriendsData(_ friends: [ItemsFriendRealm]) {
        do {
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm.init(configuration: config)
            print(realm.configuration.fileURL!)  //убрать
            let oldData = realm.objects(ItemsFriendRealm.self)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    func getFriendRealm(completion: @escaping ([ItemsFriendRealm]) -> () ){
        do{
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try Realm(configuration: config)
            let friendsFromRealm = realm.objects(ItemsFriendRealm.self)
            self.friendsRealm = Array(friendsFromRealm)
            print(friendsRealm)
            completion(self.friendsRealm)
        }catch {
            print(error)
        }
    }
    //groups
    func saveGroupsData(_ groups: [ItemsGroupRealm]) {
        do {
            let realm = try Realm()
            let oldData = realm.objects(ItemsGroupRealm.self)
            realm.beginWrite()
            print(realm.configuration.fileURL!)
            realm.delete(oldData)
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    func getGroupRealm(completion: @escaping ([ItemsGroupRealm]) -> ()){
        do{
            let realm = try Realm()
            let groupsFromRealm = realm.objects(ItemsGroupRealm.self)
            self.groupsRealm = Array(groupsFromRealm)
            completion(self.groupsRealm)
        }catch{
            print(error)
        }
    }
    //user
    func saveUserData(_ user: [UserRealm]) {
        do {
            let realm = try Realm()
            let oldData = realm.objects(UserRealm.self)
            realm.beginWrite()
            realm.delete(oldData)
            realm.add(user)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    func getUserRealm(completion: @escaping ([UserRealm]) -> ()){
        do{
            let realm = try Realm()
            let userFromRealm = realm.objects(UserRealm.self)
            self.userRealm = Array(userFromRealm)
            completion(self.userRealm)
        }catch{
            print(error)
        }
    }
}

