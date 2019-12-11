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
    let saveRealmData = SaveRealmData()
    var user = [User]()
    var userRealm = [UserRealm]()
    var stepRealm = StepRealm()
    var stepCounter = StepCounter()
    
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var ShadowView: ShadowView!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    @IBOutlet weak var LastNameUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepRealm.countStepRealm(stepCounter)
        print(stepCounter)
      vkService.loadUserData()
      saveRealmData.getUserRealm(){[weak self] userRealm in
            
         self?.userRealm = userRealm
       
         for i in userRealm{
            self?.MainLabel.text = i.firstName
            self?.LastNameUserLabel.text = i.lastName
            let avatar = i.photo50
            let urlAvatar = URL(string: avatar)!
            let dataAvatar = try? Data(contentsOf: urlAvatar)
            self?.MainImageView.image = UIImage(data: dataAvatar!)
          }
       }
    }
}
