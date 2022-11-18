//
//  ModelUser.swift
//  ProfilTest
//
//  Created by Gulnaz on 26.10.2022.
//

import Foundation
import UIKit
import MapKit

class ModelUser {
    var users = [[User]]()
    init(){
        setup()
    }
    
    func setup() {
        let man1 = User(name: "Йода", city: "Нюрнберг", image: UIImage(named: "yoda")!, gender: .male)
        let man2 = User(name: "Шмода", city: "Гамбург", image: UIImage(named: "yoda")!, gender: .male)
        
        let manArray = [man1, man2]
        
        let woman1 = User(name: "Даша", city: "Москва", image: UIImage(named: "dash")!, gender: .female)
        let woman2 = User(name: "Мурка", city: "Саратов", image: UIImage(named: "cat")!, gender: .female)
        
        let womanArray = [woman1, woman2]
        
        users.append(manArray)
        users.append(womanArray)
    }
}
