//
//  UserDefaultHelper.swift
//  Stream Mobile App
//
//  Created by Temitope on 07/04/2021.
//

import Foundation

class UserDefaultHelper {
    static let loginKey = "login"
    
    static func isLoggedIn() -> Bool {
        return UserDefaults.standard.object(forKey: loginKey) as? Bool ?? false
    }
    
    static func loginStatus(status: Bool) {
        UserDefaults.standard.setValue(status, forKey: loginKey)
    }
    
}
