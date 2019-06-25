//
//  User.swift
//  Service
//
//  Created by anton Shepetuha on 07.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var id        = String()
    @objc dynamic var firstName = String()
    @objc dynamic var lastName  = String()
    @objc dynamic var email     = String()
    @objc dynamic var confirmed = Bool()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.value(forKey: AppConstants.currentUserTokenUserDeaultKey) as? String
    }
    
    static func me() -> User? {
        guard let userID = UserDefaults.standard.value(forKey: AppConstants.currentUserIdKey) as? String else {return nil}
        let realm = try! Realm()
        return realm.objects(User.self).filter("id=='\(userID)'").first
    }
    
    @discardableResult static func toRealm(data: NSDictionary) -> User {
        let realm = try! Realm()
        
        var id = String()
        
        if let userId = data["_id"] as? String {
            id = userId
        }
        
        var user: User
        let userOptional = realm.objects(User.self).filter("id = %@", id).first
        if let userObj = userOptional {
            user = userObj
        } else {
            user = User()
            user.id = id
        }
        try! realm.write {
            
            if let confirmed = data["confirmed"] as? Bool {
                user.confirmed = confirmed
            }
            if let firstName = data["firstName"] as? String {
                user.firstName = firstName
            }
            if let lastName = data["lastName"] as? String {
                user.lastName = lastName
            }
            if let email = data["email"] as? String {
                user.email = email
            }
            
            realm.add(user)
        }
        
        return user
    }
    
}
