//
//  PostGridView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/15/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
        
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    @State var size: CGSize = .zero
 
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: size.width, height: size.width)
                    .clipped()
            }
            
            // to get the size of each column
            GeometryReader { proxy in
                HStack {} // just an empty container to triggers the onAppear
                    .onAppear {
                        size = proxy.size
                    }
            }
            
        }
        
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCK_USERS[0])
    }
}
