//
//  LoginModel.swift
//  DirectedResearch
//
//  Created by Hung-Yun Liao on 11/11/16.
//  Copyright © 2016 Hung-Yun Liao. All rights reserved.
//

import Foundation

class LoginModel {
    
    // MARK: instance variables
    var username = ""
    var password = ""
    var bankName = ""
    
    func updateInfo(username: String, password: String, bankName: String) {
        self.username = username
        self.password = password
        self.bankName = bankName
    }
    
    func inputValidation() -> Bool {
        if username == "" || password == "" {
            return false
        }
        
        let input = (userName: username, password: password)
        
        // User input validation
        let inValChar = ["@", "#","%", "^", "&", "*", "(", ")", "-", "+", "=", "{", "}"]
        
        for character in inValChar {
            if input.userName.contains(character) {
                return false
            }
        }
        return true
    }
    
}
