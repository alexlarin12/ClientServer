//
//  PhotosUserModel.swift
//  ClientServer
//
//  Created by Alex Larin on 29.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import UIKit

class PhotoUserModel: Codable {
    let response: ResponsePhoto?
    enum PhotoUserKeys:String, CodingKey {
        case response = "response"
    }
}
class ResponsePhoto: Codable {
    var count:Int
    var items:[ItemsPhoto]?
    enum ResponsePhotoKeys:String, CodingKey {
        case count = "count"
        case items = "items"
    }
}
class ItemsPhoto: Codable {
    var id:Int = 0
    var albumId:Int = 0
    var ownerId:Int = 0
    var userId:Int = 0
    var text:String = ""
    var date:Int = 0
    var postId:Int = 0
    
    var type:String = ""
    var url:String = ""
    var width:Int = 0
    var height:Int = 0
    
    enum ItemsPhotoKeys:String, CodingKey {
        case id = "id"
        case albumId = "album_id"
        case ownerId = "owner_id"
        case userId = "user_id"
        case sizes = "sizes"
        case text = "text"
        case date = "date"
        case postId = "post_id"
    }
    enum SizesPhotoKeys:String, CodingKey {
        case type = "type"
        case url = "url"
        case width = "width"
        case height = "height"
    }
    convenience required init(from decoder:Decoder) throws{
        self.init()
        
        let values = try decoder.container(keyedBy: ItemsPhotoKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.albumId = try values.decode(Int.self, forKey: .albumId)
        self.ownerId = try values.decode(Int.self, forKey: .ownerId)
        self.userId = try values.decode(Int.self, forKey: .userId)
        self.text = try values.decode(String.self, forKey: .text)
        self.date = try values.decode(Int.self, forKey: .date)
        self.postId = try values.decode(Int.self, forKey: .postId)
        
        var sizesValues = try values.nestedUnkeyedContainer(forKey: .sizes)
        let firstSizesValues = try sizesValues.nestedContainer(keyedBy: SizesPhotoKeys.self)
        self.url = try firstSizesValues.decode(String.self, forKey: .url)
        self.type = try firstSizesValues.decode(String.self, forKey: .type)
        self.width = try firstSizesValues.decode(Int.self, forKey: .width)
        self.height = try firstSizesValues.decode(Int.self, forKey: .height)
    }
}



