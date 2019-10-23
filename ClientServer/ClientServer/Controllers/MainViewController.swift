//
//  MainViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 21/10/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
let session = Session.instance
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var MainTableView: UITableView!
    @IBOutlet weak var ProfileView: ProfileView!
    @IBOutlet weak var TokenLabel: UILabel!
    
    @IBOutlet weak var UserIdLabel: UILabel!
    
    @IBAction func ChangeBackgroundButton(sender:UIButton){
        let changeColorNotification = Notification.Name("ChangeColorNotification")
        NotificationCenter.default.post(name: changeColorNotification, object: nil)
        print("one")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        MainTableView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
      
        let changeColorNotification = Notification.Name("ChangeColorNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: changeColorNotification, object: nil)
       
        if session.token == ""{
            self.TokenLabel.text = "Token is empty"
        }else{
             self.TokenLabel.text = session.token
        }
        if session.userId == 0{
            self.UserIdLabel.text = "User ID is empty. Enter an integer value"
        }else{
            self.UserIdLabel.text = String(describing: session.userId)
        }
        
        // Do any additional setup after loading the view.
    }
   
    
    @objc func changeColor(notification:Notification){
        if view.backgroundColor == #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) {
            view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            MainTableView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            print("two")
        }else{
            view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
            MainTableView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            print("three")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
