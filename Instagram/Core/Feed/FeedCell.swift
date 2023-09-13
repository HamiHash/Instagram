//
//  FeedCell.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/12/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(spacing: 4) {
            // pic and username
            HStack {
                Image("Roman")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35)
                    .clipShape(Circle())
                
                Text("Roman")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            // post
            Image("Roman")
                .resizable()
                .scaledToFit()
            
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
                Text("Roman ").fontWeight(.semibold) + Text("hey asdhg asdflasdfh ldf dshf jhdfkjhadgfnwrgherhgasdghs jdfdfj how are you doing today sir i hope youre having a great time with your stay")
            }
            .font(.footnote)
            .padding(.leading, 10)
            
            // date
            HStack {
                Text("5 hours ago")
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
        FeedCell()
    }
}
