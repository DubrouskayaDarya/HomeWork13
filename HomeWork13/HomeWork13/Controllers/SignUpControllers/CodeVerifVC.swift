//
//  CodeVerifVC.swift
//  HomeWork13
//
//  Created by Дарья Дубровская on 29.01.22.
//

import UIKit

class CodeVerifVC: UIViewController {

    @IBOutlet private weak var codeTextField: UITextField!
    @IBOutlet private weak var codeLabel: UILabel!
    
    private var code = String(Int.random(in: 10000...99999))
    
    var email: String?
    var name: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    @IBAction private func codeTextFieldEditingChanged(_ sender: UITextView) {
        guard let ourCode = sender.text else { return }
        if ourCode.count == 5 {
            if ourCode.count == 5, VerificationService.isPassConfirm(pass1: code, pass2: ourCode) {
               performSegue(withIdentifier: "goToWelcomVC", sender: nil)
            } else {
                //start timer
            }
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
            let name = name,
            let pasword = password,
            let destinationVC = segue.destination as? WelcomVC else { return }
        
        destinationVC.email = email
        destinationVC.name = name
        destinationVC.password = password
    }

    private func setupUI() {
        codeLabel.text = "please enter code \(code) from \(email ?? "")"
    }

    private func isCodeValid(code: String, ourcode: String) -> Bool {
        return code == ourcode
    }
}
