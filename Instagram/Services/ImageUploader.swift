//
//  ImageUploader.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/25/23.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            print("DEBUG: Successfuly uploaded the image to FirebaseStorage.")
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error)")
            return nil
        }
    }
}
