//
//  User.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import Foundation
import FirebaseAuth

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentId = Auth.auth().currentUser?.uid else { return true }
        return self.id == currentId
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        User(id: NSUUID().uuidString, username: "kenroy", profileImageUrl: nil, fullname: "Kendal Roy", bio: "Im the biggest son.", email: "kenroy@gmail.com"),
        User(id: NSUUID().uuidString, username: "shiv", profileImageUrl: nil, fullname: "Sibohan Roy", bio: "Hot but selfish", email: "shiv@gmail.com"),
        User(id: NSUUID().uuidString, username: "romroy", profileImageUrl: nil, fullname: nil, bio: "smart idiot", email: "roman@gmail.com"),
        User(id: NSUUID().uuidString, username: "conorroy", profileImageUrl: nil, fullname: "Mr president", bio: "Im gonna be president", email: "conorroy@gmail.com"),
        User(id: NSUUID().uuidString, username: "loganroy", profileImageUrl: nil, fullname: "Logan Roy", bio: "I built all of this...", email: "loganroy@yahoo.com"),
        User(id: NSUUID().uuidString, username: "tom", profileImageUrl: nil, fullname: nil, bio: "disgusting brother", email: "tom@gmail.com")
    ]
}
