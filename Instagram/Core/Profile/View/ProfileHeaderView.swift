//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State var editProfile: Bool = false
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(numberInput: 3, textInput: "Posts")
                    
                    UserStatView(numberInput: 7, textInput: "Followers")
                    
                    UserStatView(numberInput: 8, textInput: "Following")
                }
            }
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 5) {
                
                if let name = user.fullname {
                    Text(name)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button {
                if user.isCurrentUser {
                    editProfile.toggle()
                } else {
                    print("Follow")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .frame(width: 360, height:32)
                    .background(user.isCurrentUser ? .white : .blue)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    )
            }
        }
        .fullScreenCover(isPresented: $editProfile) {
            EditProfileView(user: user)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(editProfile: false, user: User.MOCK_USERS[1])
    }
}
