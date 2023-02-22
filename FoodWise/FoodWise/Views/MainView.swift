//
//  MainView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
                    MainRecipeView()
                        .tabItem {
                            Label("레시피", systemImage: "list.dash")
                        }
            
                    MyFridgeView()
                        .tabItem {
                            Label("내 냉장고", systemImage: "list.dash")
                        }
            
                    MyPageView()
                        .tabItem {
                            Label("마이 페이지", systemImage: "square.and.pencil")
                        }
                }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
