//
//  UserEndpoints.swift
//  Service
//
//  Created by anton Shepetuha on 07.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

extension User {
    
    // MARK: - Login
    
    @discardableResult static func login(email: String, password: String, completionHandler: @escaping ((User?, String?) -> Void)) -> URLSessionDataTask {
        let sessionData = NSMutableDictionary()
        sessionData.setValue(email, forKey: "email")
        sessionData.setValue(password, forKey: "password")
        let task = Session().sessionRequest(data: sessionData, to: "auth", method: "POST") { (result, error) in
            if let error = error {
                completionHandler(nil, error.localizedDescription)
            } else {
                if let token = result?["accessToken"] as? String {
                    UserDefaults.standard.setValue(token, forKey: AppConstants.currentUserTokenUserDeaultKey)
                    UserDefaults.standard.synchronize()
                }
                if let userData = result?["user"] as? NSDictionary {
                    let user = User.toRealm(data: userData)
                    UserDefaults.standard.setValue(user.id, forKey: AppConstants.currentUserIdKey)
                    UserDefaults.standard.synchronize()
                    completionHandler(user, nil)
                } else {
                    completionHandler(nil, "Unexpected error")
                }
            }
        }
        return task
    }
    
    // MARK: - Logout
    
    @discardableResult static func logout(completionHandler: @escaping ((String?) -> Void)) -> URLSessionDataTask {
        let sessionData = NSMutableDictionary()
        let task = Session().sessionRequest(data: sessionData, to: "users/me", method: "DELETE") { (result, error) in
            if let error = error {
                completionHandler(error.localizedDescription)
            } else {
                UserDefaults.standard.setValue(nil, forKey: AppConstants.currentUserTokenUserDeaultKey)
                UserDefaults.standard.setValue(nil, forKey: AppConstants.currentUserIdKey)
                UserDefaults.standard.synchronize()
                completionHandler(nil)
            }
        }
        return task
    }
    
    // MARK: - Register
    
    @discardableResult static func registerWith(data: NSDictionary, completionHandler: @escaping ((User?, String?) -> Void)) -> URLSessionDataTask {
        let sessionData = NSMutableDictionary()
        sessionData.setDictionary(data as! [AnyHashable: Any])
        let task = Session().sessionRequest(data: sessionData, to: "auth", method: "PUT") { (result, error) in
            if let error = error {
                completionHandler(nil, error.localizedDescription)
            } else {
                if let token = result?["accessToken"] as? String {
                    UserDefaults.standard.setValue(token, forKey: AppConstants.currentUserTokenUserDeaultKey)
                    UserDefaults.standard.synchronize()
                }
                if let userData = result?["user"] as? NSDictionary {
                    let user = User.toRealm(data: userData)
                    UserDefaults.standard.setValue(user.id, forKey: AppConstants.currentUserIdKey)
                    UserDefaults.standard.synchronize()
                    completionHandler(user, nil)
                } else {
                    completionHandler(nil, "Unexpected error")
                }
            }
        }
        return task
    }
    
}
