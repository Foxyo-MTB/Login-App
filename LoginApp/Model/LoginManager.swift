//
//  LoginManager.swift
//  LoginApp
//
//  Created by Vladimir Beliakov on 05.09.2022.
//

import Foundation

struct LoginManager {
    
    let data = LoginModel()

     func loginApproval(login: String, password: String) -> Bool {
        if login == data.login && password == data.password {
            return true
        } else {
            return false
        }
    }
}
