//
//  LoginView.swift
//  FoodWise
//
//  Created by dasoya on 17.02.23.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @ObservedObject var vm = GoogleSignInButtonViewModel()
    
   
    var body: some View {
        
        HStack{
            Spacer()
            VStack{
                Text("FoodWise와 함께 현명하게 식재료 관리할 준비되셨나요?")
                
//               Button("Google로 로그인", action: authViewModel.signIn)
                
                GoogleSignInButton(viewModel: vm, action: authViewModel.signIn)
                    .accessibilityIdentifier("GoogleSignInButton")
                    .accessibility(hint: Text("Sign in with the Google Button"))
                    .padding()
            }
            .onAppear{
                vm.style = .standard
                
            }
            Spacer()
                
        }
    }
    

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
