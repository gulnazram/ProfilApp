//
//  GreenViewController.swift
//  ProfilTest
//
//  Created by Gulnaz on 19.10.2022.
//

import UIKit

class GreenViewController: UIViewController {

    var textFromVC: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = textFromVC
    }
    
    @IBAction func goToRoot(_ sender: UIButton) {
        //на основной первый экран
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
