//
//  VKviewController+WKNavigationDelegate.swift
//  ClientServer
//
//  Created by Alex Larin on 27.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import RealmSwift

extension VKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
       // let session = Session.instance
       // let dataSessionRealm = [DataSession]()
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
            let fragment = url.fragment else {
            decisionHandler(.allow)
                return
            }
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
                
            }
        
        let token = params["access_token"]
        let userId = params["user_id"]
        print(token ?? "token is empty")
        print(userId ?? "")
       // print(userId ?? "userId is empty")
        
        
        
        
        
        
        session.token = token ?? ""
        session.userId = Int(userId ?? "") ?? 0
        let dataSession = DataSession()
        dataSession.token = session.token
        dataSession.userId = session.userId
        do {
        let realm = try Realm()
       
            realm.beginWrite()
          
            realm.add(dataSession)
            try realm.commitWrite()
        }catch{
            print(error)
        }
      
        
        performSegue(withIdentifier: "fromVKViewController", sender: dataSession.token)
        decisionHandler(.cancel)
    }
}

