//
//  Session.swift
//  ClientServer
//
//  Created by Alex Larin on 21/10/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
class Session{
    static let instance = Session()
    private init(){}
    var token:String = ""
    var userId:Int = 0
}
