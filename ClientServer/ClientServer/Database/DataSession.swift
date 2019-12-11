//
//  DataSession.swift
//  ClientServer
//
//  Created by Alex Larin on 08.12.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift
class DataSession:Object{
    @objc dynamic  var token:String = ""
    @objc dynamic var userId:Int = 0
    
}
