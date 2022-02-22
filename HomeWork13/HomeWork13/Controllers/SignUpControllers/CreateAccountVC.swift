//
//  CreateAccountVC.swift
//  HomeWork13
//
//  Created by Дарья Дубровская on 29.01.22.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var errorEmail: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var passwordFirst: UITextField!
    @IBOutlet weak var errorPassword: UILabel!
    
    @IBOutlet weak var viewRed: UIView!
    @IBOutlet weak var viewOrange: UIView!
    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var viewGreen: UIView!
    
    @IBOutlet weak var passwordSecond: UITextField!
    @IBOutlet weak var passwordMatchingError: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        setupUI()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var isEmailValid = false {
        didSet { changeButtonStateIfNeeded() }
    }
    var isPasswordValid = false {
        didSet { changeButtonStateIfNeeded() }
    }
    var isPasswordConfirmed = false {
        didSet { changeButtonStateIfNeeded() }
    }

    @IBAction func inputEmailEditingDidEnd() {
        errorEmail.isHidden = isEmailValid
    }
    
    @IBAction private func inputEmailEditingChanged() {
        isEmailValid = VerificationService.isValidEmail(inputEmail.text ?? "")
        if isEmailValid {
            errorEmail.isHidden = true
        }
    }
    
    @IBAction private func passwordFirstEditingChanged() {
        let passwordStrenght = VerificationService.isValidPassword(pass: passwordFirst.text ?? "")
        switch passwordStrenght {
        case .veryWeak:
            errorPassword.isHidden = false
            viewRed.alpha = 0.3
            viewOrange.alpha = 0.3
            viewBlue.alpha = 0.3
            viewGreen.alpha = 0.3
        case .weak:
            errorPassword.isHidden = true
            viewRed.alpha = 1
            viewOrange.alpha = 0.3
            viewBlue.alpha = 0.3
            viewGreen.alpha = 0.3
        case .notVeryWeak:
            errorPassword.isHidden = true
            viewRed.alpha = 1
            viewOrange.alpha = 1
            viewBlue.alpha = 0.3
            viewGreen.alpha = 0.3
        case .notVeryStrong:
            errorPassword.isHidden = true
            viewRed.alpha = 1
            viewOrange.alpha = 1
            viewBlue.alpha = 1
            viewGreen.alpha = 0.3
        case .strong:
            errorPassword.isHidden = true
            viewRed.alpha = 1
            viewOrange.alpha = 1
            viewBlue.alpha = 1
            viewGreen.alpha = 1
        }
        isPasswordValid = passwordStrenght == .strong
    }
    
    @IBAction private func passwordSecondEditingChanged() {
        let isPassConfirm = VerificationService.isPassConfirm(pass1: passwordFirst.text ?? "", pass2: passwordSecond.text ?? "")
        passwordMatchingError.isHidden = isPassConfirm
        isPasswordConfirmed = isPassConfirm
    }
    
    func changeButtonStateIfNeeded () {
        if isEmailValid, isPasswordConfirmed, isPasswordValid {
            signUpButton.isEnabled = true
        } else {
            signUpButton.isEnabled = false
        }
    }

    @IBAction private func signUpButtonTapped() {
    }

    private func setupUI() {
        signUpButton.isEnabled = false
        signUpButton.layer.cornerRadius = 8.0
    }
    
    // MARK: - Navigation
    
    
//    @IBAction func buttonSignUpAction() {
//        performSegue(withIdentifier: "goToCodeVerifVC", sender: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = inputEmail.text,
            let name = name.text,
            let password = passwordFirst.text,
            let destVC = segue.destination as? CodeVerifVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.password = password
    }
    
}
