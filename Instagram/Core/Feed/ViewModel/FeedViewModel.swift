//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Hamed Hashemi on 10/1/23.
//

import Foundation
import FirebaseFirestore

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() { 
        Task { try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self)})
        
        // getting the 'User' from "users" collection and adding them to our post model "Uesr?" property.
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerId = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerId)
            posts[i].user = postUser
        }
    }
    
    
}
