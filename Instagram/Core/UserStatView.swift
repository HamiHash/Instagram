//
//  UserStatView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/11/23.
//

import SwiftUI

struct UserStatView: View {
    let numberInput: Int
    let textInput: String
    
    var body: some View {
        VStack {
            Text("\(numberInput)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text("\(textInput)")
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(numberInput: 3, textInput: "Followers")
    }
}
