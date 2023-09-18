//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct InsertPasswordView: View {
    @EnvironmentObject var regViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpExtractedView(textInput: $regViewModel.password, placeHolder: "Password", title: "Create Password", description: "Your password must be at least 6 characters long")
            
            NavigationLink {
                CompleteSignUpView()
            } label: {
                Text("Next")
                    .modifier(BlueButtonModifier())
            }
            
            Spacer()
        }
    }
}

struct CreatePasswordView_Preview: PreviewProvider {
    static var previews: some View {
        InsertPasswordView()
    }
}
