//
//  UserService.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/22/23.
//

import Foundation
import Firebase

class UserService {
    
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let usersArray = try snapshot.documents.compactMap({ try $0.data(as: User.self) })
        return usersArray
    }
}
