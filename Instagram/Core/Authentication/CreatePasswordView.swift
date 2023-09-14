//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpExtractedView(textInput: $password, placeHolder: "Password", title: "Create Password", description: "Your password must be at least 6 characters long")
            
            NavigationLink {
                CompleteSignUpView()
            } label: {
                Text("Done")
                    .modifier(BlueButtonModifier())
            }
            
            Spacer()
        }
    }
}

struct CreatePasswordView_Preview: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
