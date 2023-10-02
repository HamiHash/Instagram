//
//  ContentView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var regViewModel = RegistrationViewModel()
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(regViewModel)
            } else if let currentUser = viewModel.currentUser {
                TabBar(currentUser: currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
