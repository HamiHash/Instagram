//
//  SearchView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/13/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                Image(user.profileImageUrl ?? "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                    
                                    if let name = user.fullname {
                                        Text(name)
                                            .font(.caption2)
                                    }
                                }
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.leading)
                        }
                        .navigationDestination(for: User.self) { user in
                            ProfileView(user: user)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
