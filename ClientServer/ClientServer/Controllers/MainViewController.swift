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
    
    @IBOutlet weak var GradientView: GradientView!
    @IBOutlet weak var ShadowView: ShadowView!
    @IBOutlet weak var MainImageView: UIImageView!
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.loadPhotosData()
        // Do any additional setup after loading the view.
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
