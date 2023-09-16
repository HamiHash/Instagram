//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpExtractedView(textInput: $username, placeHolder: "Username", title: "Add your username", description: "This will be showed to everyone.")
            
            NavigationLink {
                CreatePasswordView()
            } label: {
                Text("Confirm")
                    .modifier(BlueButtonModifier())
            }
            
            Spacer()
            
        }
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
