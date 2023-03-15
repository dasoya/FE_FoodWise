//
//  CustomTabView.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import SwiftUI
import UIKit

enum TabType: Int, CaseIterable {
    case recipe = 0
    case myFridge
    case Diary
    case myPage
    
    var tabItem: TabItemData {
        switch self {
        case .recipe:
            return TabItemData(image: "Recipe", selectedImage: "onRecipe", title: "레시피")
        case .myFridge:
            return TabItemData(image: "Myfridge", selectedImage: "onMyfidge", title: "내 냉장고")
        case .Diary:
            return TabItemData(image: "Diary", selectedImage: "onDiary", title: "식단 일지")
        case .myPage:
            return TabItemData(image: "Mypage", selectedImage: "onMypage", title: "마이 페이지")
        }
    }
}

struct CustomTabView<Content: View>: View {
    
    let tabs: [TabItemData]
    @Binding var selectedIndex: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(tabs.indices) { index in
                    content(index)
                        .tag(index)
                }
            }
            
            VStack {
                Spacer()
                TabBottomView(tabbarItems: tabs, selectedIndex: $selectedIndex)
            }
            .padding(.bottom, 8)
        }
    }
}

struct TabBottomView: View {
    
    let tabbarItems: [TabItemData]
    var height: CGFloat = 70
    @Binding var selectedIndex: Int
    
    var body: some View {
        
        VStack{
            
            Divider()
            
            HStack {
                
                Spacer()
                
                
                ForEach(tabbarItems.indices) { index in
                    let item = tabbarItems[index]
                    Button {
                        self.selectedIndex = index
                    } label: {
                        let isSelected = selectedIndex == index
                        TabItemView(data: item, isSelected: isSelected)
                        
                    }
                    Spacer()
                }
            }
            .frame(height: height)
            //   .background(Color.white)
            // .shadow(radius: 5, x: 0, y: 4)
        }}
}


struct TabItemData {
    let image: String
    let selectedImage: String
    let title: String
}


struct TabItemView: View {
    let data: TabItemData
    let isSelected: Bool
    
    
    var body: some View {
        VStack {
            
           
                Image(isSelected ? data.selectedImage : data.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                    .animation(.default)
            
          
            
            Spacer().frame(height: 4)
            
            Text(data.title)
                .foregroundColor(isSelected ? .black : .gray)
                .font(.system(size: 14))
        }
        
        
    }
}
