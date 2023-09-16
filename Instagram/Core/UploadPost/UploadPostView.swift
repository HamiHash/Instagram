//
//  UploadPostView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/16/23.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @Binding var selectedIndex: Int
    @StateObject var viewModel = UploadPostViewModel()
    @State private var imagePickerPresented = false
    
    var body: some View {
        VStack {
            // nav
            HStack {
                Button {
                    caption = ""
                    selectedIndex = 0
                } label: {
                    Text("Cancel")
                        .font(.subheadline)
                }
                
                Spacer()

                Text("New Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Share")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .padding(15)
            
            // Image picker and caption
            HStack {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaledToFill()
                        .clipped()
                        .padding(5)
                        .cornerRadius(20)
                }
                
                TextField(" Caption", text: $caption, axis: .vertical)
                    .textInputAutocapitalization(.never)

            }
            
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(selectedIndex: .constant(0))
    }
}
