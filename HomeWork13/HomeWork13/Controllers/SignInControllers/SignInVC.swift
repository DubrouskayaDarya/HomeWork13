//
//  ViewController.swift
//  HomeWork13
//
//  Created by Дарья Дубровская on 29.01.22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var labelUserNotFound: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToSignInVC(_ unwindSegue: UIStoryboardSegue) {
    }

    func setupUI() {
        signInButton.layer.cornerRadius = 8.0
    }
}

