//
//  SearchView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/13/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(0...8, id: \.self) { user in
                        HStack {
                            Image("Roman")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("roman")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                
                                Text("Roman Roy")
                                    .font(.caption2)
                            }
                            
                            Spacer()
                        }
                        .padding(.leading)
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
