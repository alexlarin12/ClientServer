//
//  UserRealm.swift
//  ClientServer
//
//  Created by Alex Larin on 17.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift
class UserRealm: Object {
    @objc dynamic var id:Int = 0
    @objc dynamic var firstName:String = ""
    @objc dynamic var lastName:String = ""
    @objc dynamic var isClosed:Bool = true
    @objc dynamic var canAccessClosed:Bool = true
    @objc dynamic var photo50:String = ""
}
