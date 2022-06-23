//
//  TasksViewController.swift
//  firebase todo
//
//  Created by Павел Тимофеев on 21.06.2022.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.backgroundColor = .clear
        cell?.textLabel?.text = "\(indexPath.row)"
        cell?.textLabel?.textColor = .white
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
    }
    
}
