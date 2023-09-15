//
//  User.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        User(id: NSUUID().uuidString, username: "kenroy", profileImageUrl: "ken", fullname: "Kendal Roy", bio: "Im the biggest son.", email: "kenroy@gmail.com"),
        User(id: NSUUID().uuidString, username: "shiv", profileImageUrl: "shiv", fullname: "Sibohan Roy", bio: "Hot but selfish", email: "hot@gmail.com"),
        User(id: NSUUID().uuidString, username: "romroy", profileImageUrl: "Roman", fullname: nil, bio: "smart idiot", email: "roman@gmail.com"),
        User(id: NSUUID().uuidString, username: "president-roy", profileImageUrl: "con", fullname: "Mr president", bio: "Im gonna be president", email: "president@gov.com"),
        User(id: NSUUID().uuidString, username: "loganroy", profileImageUrl: "logan", fullname: "Logan Roy", bio: "I built all of this...", email: "logan@yahoo.com"),
        User(id: NSUUID().uuidString, username: "tom", profileImageUrl: "tom", fullname: nil, bio: "disgusting brother", email: "tom@yahoo.com")
    ]
}
