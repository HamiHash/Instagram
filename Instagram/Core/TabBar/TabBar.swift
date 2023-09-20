//
//  TabBar.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/11/23.
//

import SwiftUI

struct TabBar: View {
    
    @State private var selectedIndex: Int = 0
    let currentUser: User
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(selectedIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            Text("Notifications")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "heart")
                }.tag(3)
            
            SelfProfileView(user: currentUser)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .tint(.black)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(currentUser: User.MOCK_USERS[5])
    }
}
