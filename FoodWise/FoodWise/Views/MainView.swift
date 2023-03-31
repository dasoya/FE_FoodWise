//
//  MainView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import SwiftUI

struct MainView: View {
        
        
        @State var selectedIndex: Int = 0
            
            var body: some View {
                CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
                    
                    let type = TabType(rawValue: index) ?? .recipe
                    getTabView(type: type)
                }
            }
            
            @ViewBuilder
            func getTabView(type: TabType) -> some View {
                switch type {
                case .recipe:
                    MainRecipeView()
                case .myFridge:
                    MyFridgeView()
                case .Diary:
                    DiaryView()
                case .myPage:
                    MyPageView()
                }
            }
        
        
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
