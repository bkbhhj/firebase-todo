//
//  ViewController.swift
//  firebase todo
//
//  Created by Павел Тимофеев on 21.06.2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var warnLabel: UILabel!
 
    
    @IBOutlet weak var emaiTextField: UITextField!
    
    @IBOutlet weak var passwordtextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warnLabel.alpha = 0
        Auth.auth().addStateDidChangeListener { [weak self] (auth, user) in
            if user != nil {
                self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emaiTextField.text = ""
        passwordtextField.text = ""
    }

    func displayWarningLabel(withText text: String) {
        warnLabel.text = text
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1,initialSpringVelocity: 1, options: .curveEaseOut) { [weak self] in
            self?.warnLabel.alpha = 1
        } completion: { [weak self] complete in
            self?.warnLabel.alpha = 0
        }

    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emaiTextField.text, let password = passwordtextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                self.displayWarningLabel(withText: "error")
                return
            }
            if user != nil {
                self.performSegue(withIdentifier: "tasksSegue", sender: nil)
                return
            }
            self.displayWarningLabel(withText: "No such user")
        })
    
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
        guard let email = emaiTextField.text, let password = passwordtextField.text, email != "", password != "" else {
            displayWarningLabel(withText: "Info is incorrect")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {  (user, error) in
            
            if error == nil {
                if user != nil {
   //                 self?.performSegue(withIdentifier: "tasksSegue", sender: nil)
                } else {
                    print("user is not created")
                }
            } else {
                print(error?.localizedDescription)
            }
            
        }
        
    }
}

