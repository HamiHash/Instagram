//
//  AuthService.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/16/23.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch let error as NSError {
            print("DEBUG: failed to login user with: \(error.localizedDescription) error: \(error.underlyingErrors.debugDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch let error as NSError {
            print("DEBUG: failed to register user with: \(error.localizedDescription) error: \(error.underlyingErrors.debugDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    @MainActor
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
