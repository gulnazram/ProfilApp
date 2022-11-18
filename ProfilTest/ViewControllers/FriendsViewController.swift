//
//  FriendsViewController.swift
//  ProfilTest
//
//  Created by Gulnaz on 26.10.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    let cellId = "UserTableViewCell"
    var modelUser = ModelUser()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    //число ячеек, кол-во строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let section = modelUser.users[section]
        return section.count
    }
    

    //кол-во секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelUser.users.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Кабель"
        } else {
            return "Сука"
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! UserTableViewCell
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        
        cell.nameLabel.text = user.name
        cell.userImageView.image = user.image
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        
        let alert = UIAlertController(title: user.name, message: user.city, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Профиль", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goToProfile", sender: indexPath)
        }
        
        let deleteAction = UIAlertAction(title: "Удалить из друзей", style: .destructive) { (alert) in
            self.modelUser.users[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        alert.addAction(profileAction)
        alert.addAction(deleteAction)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProfile" {
            let vc = segue.destination as! UserViewController
            let indexPath = sender as! IndexPath
            
            let section = modelUser.users[indexPath.section]
            let user = section[indexPath.row]
            vc.user = user
        }
    }
}
