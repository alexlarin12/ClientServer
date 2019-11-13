//
//  LaunchViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 21/10/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class VKViewController: UIViewController {
    let vkService = VKService()
    let session = Session.instance
  
    @IBOutlet weak var webview: WKWebView!{
          didSet{webview.navigationDelegate = self
       }
   }
    @IBAction func UnwindSegue(unwindSegue:UIStoryboardSegue){
        
    }
    override func viewDidLoad() {
         super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7143864"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.101")
        ]
        let request = URLRequest(url: urlComponents.url!)
        webview.load(request)
}
    
   
    
    
 
        
    //   let changeColorNotification = Notification.Name("ChangeColorNotification")
     //  1 NotificationCenter.default.post(name: changeColorNotification, object: nil)

   
    
    
    
    

   
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
