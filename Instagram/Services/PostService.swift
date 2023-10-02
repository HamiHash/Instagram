//
//  PostService.swift
//  Instagram
//
//  Created by Hamed Hashemi on 10/2/23.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    static func fetchPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        // getting the 'User' from "users" collection and adding them to our post model "Uesr?" property.
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerId = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(withUid uid: String) async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
    }
}
