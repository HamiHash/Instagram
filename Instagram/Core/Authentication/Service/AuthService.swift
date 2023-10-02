//
//  AuthService.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            // Reseting the currentUser
            try await loadUserData()
        } catch let error as NSError {
            print("DEBUG: failed to login user with: \(error.localizedDescription) error: \(error.underlyingErrors.debugDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        } catch let error as NSError {
            print("DEBUG: failed to register user with: \(error.localizedDescription) error: \(error.underlyingErrors.debugDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws {
        // setting the user session
        self.userSession = Auth.auth().currentUser
        // get the current user id (to access the document in the 'users' colection)
        guard let currentUid = userSession?.uid else { return }
        // get document from Firebase and encoding the user data from Firebase, to a User model
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        // Creating User
        let user = User(id: uid, username: username, email: email)
        // Setting currentUser to the one that just created
        self.currentUser = user
        // Encode (documentData type)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { fatalError("Could'nt encode user data") }
        // Save User to firestore
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
