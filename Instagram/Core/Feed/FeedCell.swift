//
//  FeedCell.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/12/23.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack(spacing: 4) {
            // pic and username
            HStack {
                CircularProfileImageView(user: post.user!, size: .xSmall)
                
                Text(post.user!.username)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            // post
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
            
            // buttons
            HStack(spacing: 16) {
                Button {
                    print("Heart button pressed")
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button {
                    print("Comment button pressed")
                } label: {
                    Image(systemName: "bubble.right")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Button {
                    print("Heart button pressed")
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 10)
            
            // username and caption
            HStack {
                Text("\(post.user!.username) ").fontWeight(.semibold) + Text("\(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            
            // date
            HStack {
                Text("\(post.timestamp)")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[10])
    }
}
