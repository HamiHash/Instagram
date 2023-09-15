//
//  Post.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Having a hard time becouse i lost everytghinh today ajsdgasdh askdjf iohdf lkasf ah flsa fshf shaud .", likes: 100, imageUrl: "k1", timestamp: Date(), user: User.MOCK_USERS[0]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "I hate shiv and roman.", likes: 15000, imageUrl: "k2", timestamp: Date(), user: User.MOCK_USERS[0]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Drinking my pain.", likes: 22222, imageUrl: "k3", timestamp: Date(), user: User.MOCK_USERS[0]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "I'm an idiot.", likes: 0, imageUrl: "r1", timestamp: Date(), user: User.MOCK_USERS[2]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "I'm an idiot again.", likes: 6, imageUrl: "r2", timestamp: Date(), user: User.MOCK_USERS[2]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "I'm an idiot again again.", likes: 36, imageUrl: "r3", timestamp: Date(), user: User.MOCK_USERS[2]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Hello", likes: 0, imageUrl: "s1", timestamp: Date(), user: User.MOCK_USERS[1]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Im sorry", likes: 6, imageUrl: "s2", timestamp: Date(), user: User.MOCK_USERS[1]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Im not sorry", likes: 2, imageUrl: "s3", timestamp: Date(), user: User.MOCK_USERS[1]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Im the boss", likes: 0, imageUrl: "l1", timestamp: Date(), user: User.MOCK_USERS[4]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Im th boosss", likes: 65, imageUrl: "l2", timestamp: Date(), user: User.MOCK_USERS[4]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Gonna be president", likes: 210, imageUrl: "c1", timestamp: Date(), user: User.MOCK_USERS[3]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "CONNOR 3030 !!!", likes: 10, imageUrl: "c2", timestamp: Date(), user: User.MOCK_USERS[3]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "NEW boss in town", likes: 30, imageUrl: "t1", timestamp: Date(), user: User.MOCK_USERS[5]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Im the king", likes: 20, imageUrl: "t2", timestamp: Date(), user: User.MOCK_USERS[5])
    ]
}
