//
//  StepRealm.swift
//  ClientServer
//
//  Created by Alex Larin on 24.11.2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation
import RealmSwift
class StepRealm {
    let stepCounter = StepCounter()
    var token:NotificationToken?
    func countStepRealm(_ steps:StepCounter) {
        do{
        let realm = try Realm()
        realm.beginWrite()
        stepCounter.steps += 1
        realm.add(stepCounter)
        try realm.commitWrite()
        
        }catch{
            print(error)
        }
        token = stepCounter.observe {change in
            switch change {
            case .change(let properties):
                print(properties)
            case .error(let error):
                print("An error occurred: \(error)")
            case .deleted:
                print("The object was deleted.")
            }
        }
        do {
            let realm = try Realm()
            realm.beginWrite()
            try realm.commitWrite()
        } catch {
            print(error)
        }

    }
}
