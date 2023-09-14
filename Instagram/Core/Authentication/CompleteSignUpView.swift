//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to Instagram.")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 30)
                .multilineTextAlignment(.center)
            
            Text("Click below to complete registration.")
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            Button {
                
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
