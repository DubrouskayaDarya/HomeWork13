//
//  WelcomVC.swift
//  HomeWork13
//
//  Created by Дарья Дубровская on 29.01.22.
//

import UIKit

class WelcomVC: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!
    
    var email: String?
    var name: String?
    var password: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        signUpButton.layer.cornerRadius = 8.0
    }

    
    @IBAction func signUpButtonTouchUpInside() {
        guard let email = email,
              let pass = password else { return }
//        UserDefaults.standard.set(name, forKey: Constants.name)
//        UserDefaults.standard.set(email, forKey: Constants.email)
//        UserDefaults.standard.set(password, forKey: Constants.password)
//        navigationController?.popToRootViewController(animated: true)
    }
}
    // MARK: - Navigation
    
    
