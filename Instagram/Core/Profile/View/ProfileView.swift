//
//  ProfileView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            // Header
            ProfileHeaderView(user: user)
            
            Divider()
            
            // Grid
            PostGridView(user: user)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[2])
    }
}
