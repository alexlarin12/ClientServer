//
//  FriendsUserModel.swift
//  ClientServer
//
//  Created by Alex Larin on 29.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import UIKit
class FriendUserModel: Decodable {
    let response:ResponseFriend?
    enum UserFriendKeys:String, CodingKey {
        case response = "response"
    }
}
class ResponseFriend: Decodable {
    var count:Int
    var items:[ItemsFriend]?
    enum ResponseFriendKeys:String,CodingKey {
        case count = "count"
        case items = "items"
    }
}
class ItemsFriend:NSObject, Decodable{
    dynamic var id:Int = 0
    dynamic var firstName:String = ""
    dynamic var lastName:String = ""
    dynamic var isClosed:Bool = true
    dynamic var canAccessClosed:Bool = true
    //   var bdate:String = ""
    dynamic var online:Int = 0
    dynamic var trackCode:String = ""
    enum ItemsFriendKeys:String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        //    case bdate = "bdate"
        case online = "online"
        case trackCode = "track_code"
    }
    convenience required init(from decoder:Decoder) throws{
        self.init()
        let values = try decoder.container(keyedBy: ItemsFriendKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.isClosed = try values.decode(Bool.self, forKey: .isClosed)
        self.canAccessClosed = try values.decode(Bool.self, forKey: .canAccessClosed)
        //        self.bdate = try values.decode(String.self, forKey: .bdate)
        self.online = try values.decode(Int.self, forKey: .online)
        self.trackCode = try values.decode(String.self, forKey: .trackCode)
        print(firstName)
        print(lastName)
        print(id)
    }
}
