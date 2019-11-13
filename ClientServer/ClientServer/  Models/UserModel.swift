//
//  UserModel.swift
//  ClientServer
//
//  Created by Alex Larin on 13.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift

class UserModel: Decodable {
    let response:[User]?
    enum UserKeys:String, CodingKey {
        case response = "response"
    }
}

class User :Object, Decodable{
    
   @objc dynamic var id:Int = 0
   @objc dynamic var firstName:String = ""
   @objc dynamic var lastName:String = ""
   @objc dynamic var isClosed:Bool = true
   @objc dynamic var canAccessClosed:Bool = true
   @objc dynamic var photo50:String = ""
   
    enum UserKeys:String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo50 = "photo_50"
       
    }
    
    convenience required init(from decoder:Decoder) throws{
        self.init()
        let values = try decoder.container(keyedBy: UserKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.firstName = try values.decode(String.self, forKey: .firstName)
        self.lastName = try values.decode(String.self, forKey: .lastName)
        self.isClosed = try values.decode(Bool.self, forKey: .isClosed)
        self.canAccessClosed = try values.decode(Bool.self, forKey: .canAccessClosed)
        self.photo50 = try values.decode(String.self, forKey: .photo50)
        
    }
}