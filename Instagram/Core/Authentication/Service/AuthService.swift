//
//  AuthService.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

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
            print("DEBUG: Did create user in firebase.")
            await uploadUserData(uid: result.user.uid, username: username, email: email)
            print("DEBUG: Did upload user data.")
        } catch let error as NSError {
            print("DEBUG: failed to register user with: \(error.localizedDescription) error: \(error.underlyingErrors.debugDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        // Creating User
        let user = User(id: uid, username: username, email: email)
        // Encode (documentData type)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { fatalError("Could'nt encode user data") }
        // Save User to firestore
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
