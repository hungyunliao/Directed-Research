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
    var json: Data?
    var retJson: Data?
    
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
        
        // everything is okay, ready to postRequest
        postRequest()
        // parse retJson
        // if retJson indicates its content is error, eg. wrong password etc, then return false
        // else return true
           
        return true
    }
    
    func getReturnJson() -> Data? {
        return retJson
    }
    
    func postRequest() {
        // Directly connect to Plaid
        let urlString = "https://tartan.plaid.com/connect?client_id=test_id&secret=test_secret&username=" + self.username + "&password=" + self.password + "&type=wells"
        // Through Flask server
        // let urlString = "http://172.20.10.10:5000/login?client_id=test_id&secret=test_secret&bankAccount=" + usrname + "&bankPassword=" + psw + "&bankName=wells"
        
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            guard error == nil && data != nil else {                        // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            self.json = data!
            print("responseString = \(self.json)") // check if the JSON is returned
        })
        
        task.resume()
        
        while json == nil {  // make sure the JSON file is indeed returned.
            print("still nil")
        }
        
        retJson = json
        json = nil
        
    }

    
}
