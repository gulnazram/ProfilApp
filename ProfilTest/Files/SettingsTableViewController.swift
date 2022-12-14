//
//  SettingsTableViewController.swift
//  ProfilTest
//
//  Created by Gulnaz on 25.10.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let testString = "testString"
    let nameKey = "nameKey"
    let soundKey = "soundKey"
    let vibrationKey = "vibrationKey"
    let volKey = "volKey"
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    @IBOutlet weak var vibrationSwitch: UISwitch!
    
    @IBOutlet weak var volSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
    }

    
    func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: nameKey) {
            nameField.text = name
        }
        
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: soundKey)
        vibrationSwitch.isOn = UserDefaults.standard.bool(forKey: vibrationKey)
        volSlider.value = UserDefaults.standard.float(forKey: volKey)
    }
    @IBAction func changeNameAction(_ sender: UITextField) {
        
        if (sender.text != nil ) {
            UserDefaults.standard.set(sender.text!, forKey: nameKey)
        }
    }
    
    
    @IBAction func soundAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    
    
    @IBAction func vibrationAction(_ sender: UISwitch) {
    }
    
    
    @IBAction func volAction(_ sender: UISlider) {
        
        UserDefaults.standard.set(sender.value, forKey: volKey)
    }
}
