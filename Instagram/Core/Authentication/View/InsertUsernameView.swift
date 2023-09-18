//
//  CreateUsernameView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct InsertUsernameView: View {
    @EnvironmentObject var regViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            SignUpExtractedView(textInput: $regViewModel.username, placeHolder: "Username", title: "Add your username", description: "This will be showed to everyone.")
            
            NavigationLink {
                InsertPasswordView()
            } label: {
                Text("Next")
                    .modifier(BlueButtonModifier())
            }
            
            Spacer()
            
        }
    }
}

struct CreateUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        InsertUsernameView()
    }
}
