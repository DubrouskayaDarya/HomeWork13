//
//  ViewController.swift
//  HomeWork13
//
//  Created by Дарья Дубровская on 29.01.22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelUserNotFound: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    var email: String?
    var name: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToSignInVC(_ unwindSegue: UIStoryboardSegue) {
    }
    
    func inputValueToEmail() {
        if emailTextField.text == UserDefaults.standard.string(forKey: email ?? "") {
            signInButton.isEnabled = true
        }
    }
    
    func setupUI() {
        signInButton.isEnabled = false
        signInButton.layer.cornerRadius = 8.0
    }
}

