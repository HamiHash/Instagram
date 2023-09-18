//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @EnvironmentObject var regViewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to Instagram \(regViewModel.username).")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration.")
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            Button {
                Task { try await regViewModel.createUser() }
            } label: {
                Text("Continue")
                    .modifier(BlueButtonModifier())
            }
        }
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}
