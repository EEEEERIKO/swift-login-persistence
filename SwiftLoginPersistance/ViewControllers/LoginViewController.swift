//
//  LoginViewController.swift
//  SwiftLoginPersistance
//
//  Created by Erik Valencia Cardona on 14/10/26.
//

import UIKit

final class LoginViewController: UIViewController {
    private let sessionManager = SessionManager()
    
    @IBOutlet private weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
    }
    
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text?
            .trimmingCharacters(in: .whitespacesAndNewlines),
              isValidEmail(email) else {
            showInvalidEmailAlert()
            return
        }
        
        sessionManager.saveSession(email: email)
        navigateToHome()
    }
    
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern =
            #"^[A-Z a-z0-9.!#$%&'*+/=?^_`{|}~-]+@[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?(?:\.[A-Za-z0-9](?:[A-Za-z0-9-]{0,61}[A-Za-z0-9])?)+$"#
                .replacingOccurrences(of: " ", with: "")

        return email.range(
            of: emailPattern,
            options: .regularExpression
        ) != nil
    }

    
    private func showInvalidEmailAlert() {
        let alert = UIAlertController(
                title: "Invalid Email",
                message: "Please enter a valid email address.",
                preferredStyle: .alert
            )
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default)
        )
        
        present(alert, animated: true)
    }
    
    private func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let homeViewController = storyboard.instantiateViewController(
            withIdentifier: "HomeViewController"
        ) as? HomeViewController else {
            assertionFailure("Could not instantate HomeViewController")
            return
        }
        
        navigationController?.setViewControllers(
            [homeViewController],
            animated:true
        )
    }
}
