//
//  LaunchViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 21/10/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {
     let session = Session.instance
   
    @IBOutlet weak var TokenTextField: UITextField!
    
    @IBOutlet weak var UserIdTextField: UITextField!
    
    
    
    @IBAction func ButtonTap(_ sender: UIButton) {
        session.token = TokenTextField.text ?? ""
        session.userId = Int(UserIdTextField.text ?? "") ?? 0
    }
    
    @IBAction func ChangeColorTap(_ sender: UIButton) {
        
        
    //   let changeColorNotification = Notification.Name("ChangeColorNotification")
     //   NotificationCenter.default.post(name: changeColorNotification, object: nil)

    }
    
    
    
    
    
    @IBAction func UnwindSegue(unwindSegue:UIStoryboardSegue){
       
    }
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        let changeColorNotification = Notification.Name("ChangeColorNotification")
        NotificationCenter.default.addObserver(self, selector: #selector(changeColor(notification:)), name: changeColorNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func changeColor(notification: Notification){
        if view.backgroundColor == #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1){
            view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }else{
            view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
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
