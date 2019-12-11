//
//  ItemsFriendRealm.swift
//  ClientServer
//
//  Created by Alex Larin on 16.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift
class ItemsFriendRealm: Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var firstName:String = ""
    @objc dynamic var lastName:String = ""
    @objc dynamic var isClosed:Bool = true
    @objc dynamic var canAccessClosed:Bool = true
    @objc dynamic var photo50:String = ""
    @objc dynamic var online:Int = 0
    @objc dynamic var trackCode:String = ""
    
 //   override static func primaryKey() -> String? {
   // return "id"
   // }
    override static func indexedProperties() -> [String] {
        return ["firstName"]
    }

}
