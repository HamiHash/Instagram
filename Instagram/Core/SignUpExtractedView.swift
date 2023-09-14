//
//  SignUpView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct SignUpExtractedView: View {
    @Binding var textInput: String
    let placeHolder: String
    let title: String
    let description: String
    
    var body: some View {
        Text("\(title)")
            .font(.title2)
            .fontWeight(.semibold)
            .padding(.top, 30)
        
        Text("\(description)")
            .font(.footnote)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
        
        if placeHolder == "Password" {
            SecureField("\(placeHolder)", text: $textInput)
                .modifier(GrayTextFieldModifier())
                .padding(.vertical)
        } else {
            TextField("\(placeHolder)", text: $textInput)
                .textInputAutocapitalization(.never)
                .modifier(GrayTextFieldModifier())
                .padding(.vertical)
        }
    }
}
