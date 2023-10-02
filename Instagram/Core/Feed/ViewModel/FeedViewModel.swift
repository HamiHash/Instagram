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
        self.posts = try await PostService.fetchPosts()
    }
}
