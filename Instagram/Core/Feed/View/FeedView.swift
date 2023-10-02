//
//  FeedView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/12/23.
//

import SwiftUI

struct FeedView: View {
    let posts = Post.MOCK_POSTS
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                            .padding(.bottom)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Instagram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    }
                }
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
