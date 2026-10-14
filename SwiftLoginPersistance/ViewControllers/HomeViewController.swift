//
//  HomeViewController.swift
//  SwiftLoginPersistance
//
//  Created by Erik Valencia Cardona on 14/10/26.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let sessionManager = SessionManager()
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        displayUserSession()
    }
    
    private func displayUserSession() {
        
        guard let session = sessionManager.loadSession() else {
            navigateToLogin()
            return
        }
        
        welcomeLabel.text = "Welcome!"
        emailLabel.text = session.email
    }
    
    @IBAction private func logoutButtonTapped(_ sender: UIButton) {
        sessionManager.logout()
        navigateToLogin()
    }
    
    private func navigateToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let loginViewController = storyboard.instantiateViewController( withIdentifier: "LoginViewController") as? LoginViewController else {
            assertionFailure("Could not instantiate LoginViewController")
            return
        }
        navigationController?.setViewControllers(
            [loginViewController],
            animated: true
        )
    }
}
