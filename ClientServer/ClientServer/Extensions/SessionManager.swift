//
//  SessionManager.swift
//  ClientServer
//
//  Created by Alex Larin on 27.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import Alamofire
extension SessionManager{
    static let custom:SessionManager = {
    let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    let sessionManager = SessionManager(configuration: configuration)
    return sessionManager
    }()
}
