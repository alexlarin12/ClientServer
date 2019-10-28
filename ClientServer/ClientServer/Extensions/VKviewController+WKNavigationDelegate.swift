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

extension VKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
       // let session = Session.instance
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
        print(userId ?? "userId is empty")
        
        session.token = token ?? ""
        session.userId = Int(userId ?? "") ?? 0
        
        decisionHandler(.cancel)
    }
}
