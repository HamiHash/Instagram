//
//  SelfProfileView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import SwiftUI

struct SelfProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Header
                ProfileHeaderView(user: user)
                
                Divider()
                
                //Grid
                PostGridView(user: user)
            }
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


struct SelfProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfileView(user: User.MOCK_USERS[0])
    }
}
