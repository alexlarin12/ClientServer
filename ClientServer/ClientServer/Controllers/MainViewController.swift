//
//  MainViewController.swift
//  ClientServer
//
//  Created by Alex Larin on 27.10.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let vkService = VKService()
    var user = [User]()
    
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var ShadowView: ShadowView!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    @IBOutlet weak var LastNameUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     vkService.loadUserData(){[weak self] user in
            self?.user = user
            print(user)
        for i in user{
            self?.MainLabel.text = i.firstName
            self?.LastNameUserLabel.text = i.lastName
            let avatar = i.photo50
            let urlAvatar = URL(string: avatar)!
            let dataAvatar = try? Data(contentsOf: urlAvatar)
            self?.MainImageView.image = UIImage(data: dataAvatar!)
            
        }
       
            
        } // Do any additional setup after loading the view.
      
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
