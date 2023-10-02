//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Hamed Hashemi on 10/2/23.
//

import Foundation

@MainActor
class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    func fetchUserPosts() async throws {
        print("DEBUG: user.id = \(user.id)")
        self.posts = try await PostService.fetchUserPosts(withUid: user.id)
        print("DEBUG: fetchUserPosts successful. \(posts)")
        
        for i in 0..<posts.count {
            posts[i].user = self.user
            print("DEBUG: \(posts[i])")
        }
    }
}
