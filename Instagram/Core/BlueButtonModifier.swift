//
//  BlueButtonModifier.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct BlueButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 320, height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}
