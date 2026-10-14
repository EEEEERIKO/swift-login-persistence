//
//  SessionManager.swift
//  SwiftLoginPersistance
//
//  Created by Erik Valencia Cardona on 14/10/26.
//

import Foundation

final class SessionManager {
    
    private let defaults: UserDefaults
    
    private let emailKey = "userEmail"
    private let isLoggedInKey = "isLoggedIn"
    
    init( defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func saveSession(email: String) {
        defaults.set(email, forKey: emailKey)
        defaults.set(true, forKey: isLoggedInKey)
    }
    
    func loadSession() -> UserSession? {
        guard defaults.bool(forKey: isLoggedInKey),
            let email = defaults.string(forKey: emailKey) else {
                return nil
        }
        
        return UserSession( email: email, isLoggedIn: true)
    }
    
    
    func isLoggedIn() -> Bool {
        defaults.bool(forKey: isLoggedInKey)
    }
    
    func logout() {
        defaults.removeObject(forKey: emailKey)
        defaults.removeObject(forKey: isLoggedInKey)
    }
}


