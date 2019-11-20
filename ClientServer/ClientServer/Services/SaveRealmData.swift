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
    func saveFriendsData(_ friends: [ItemsFriendRealm]) {
        do {
            let realm = try Realm()
            print(realm.configuration.fileURL!)  //убрать
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    func saveGroupsData(_ groups: [ItemsGroupRealm]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(groups)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
    func saveUserData(_ user: [UserRealm]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(user)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
