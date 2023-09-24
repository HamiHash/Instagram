//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/23/23.
//

import SwiftUI
import Firebase
import PhotosUI

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var fullname = ""
    @Published var bio = ""
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let data = try? await item?.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String: Any]() // creating a new data file to store values and push it to firebase
        
        // update profile if changed
        
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
            print("DEBUG: Fullname: \(fullname)")
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
            print("DEBUG: bio: \(bio)")
        }
        
        // add the created data to the firebase
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}


