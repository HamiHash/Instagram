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
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let data = try? await item?.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}


