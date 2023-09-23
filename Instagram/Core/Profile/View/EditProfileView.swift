//
//  EditProfileView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/23/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    @State private var imagePickerPresented = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                
                Spacer()
                
                Text("Edit Profile")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("Done") {
                    
                }
                .fontWeight(.semibold)
            }
            .padding(.horizontal)
            
            Divider()
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    }
                    
                    Text("Edit Profile Picture")
                        .foregroundColor(.blue)
                        .font(.footnote)
                        .fontWeight(.bold)
                }
                .padding(.top, 8)
            }
            Divider()
            
            
            EditProfileRowView(title: "Name", text: $viewModel.fullname)
            Divider ()
            EditProfileRowView(title: "Bio", text: $viewModel.bio)
            Divider ()
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding (.leading, 8)
                .frame (width: 65, alignment: .leading)
         
                TextField ("", text: $text)
                .textInputAutocapitalization(.never)
        }
        .font (. subheadline)
        .frame (height: 30)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
