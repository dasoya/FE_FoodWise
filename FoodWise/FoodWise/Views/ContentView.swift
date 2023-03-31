//
//  ContentView.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    
    var body: some View {
        return Group {
          NavigationView {
            switch authViewModel.state {
            case .signedIn:
                
                MainView()

            case .signedOut:
                LoginView()
                
//                .navigationTitle(
//                  NSLocalizedString(
//                    "Sign-in with Google",
//                    comment: "Sign-in navigation title"
//                  ))
            }
          }
          #if os(iOS)
          .navigationViewStyle(StackNavigationViewStyle())
          #endif
        }
       
    }
}


