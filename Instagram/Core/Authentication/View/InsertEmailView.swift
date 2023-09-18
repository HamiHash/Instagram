//
//  AddEmailView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct InsertEmailView: View {
    @EnvironmentObject var regViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpExtractedView(textInput: $regViewModel.email, placeHolder: "Email", title: "Add your Email", description: "You'll use this email to sign in to your account")
            
            NavigationLink {
                InsertUsernameView()
            } label: {
                Text("Next")
                    .modifier(BlueButtonModifier())
            }
            
            Spacer()
            
        }
    }
}

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        InsertEmailView()
    }
}
