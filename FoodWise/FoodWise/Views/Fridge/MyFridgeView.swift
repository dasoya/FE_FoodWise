//
//  MyFridgeView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import SwiftUI
import UIKit

struct MyFridgeView: View {
    
//    var fridgeSectionImageDict = ["육류": "meat",
//                                  "해산물": "seafood","과일": "fruit","유제품": "dairy","채소": "vegetable","기타": "etc"]
//
//
//    var inventory = ["육류" : TestData.ingredients,"해산물": TestData.ingredients]
    let attributedText = Text("지난 달에 ") + Text("100g").foregroundColor(Color.myprimary).bold() + Text("의\n식재료를 낭비했어요")
    @State var showModal = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            ZStack() {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.mygray)
                .frame(width: 350, height: 87)

                HStack{
                    Image("leftover")
                        .resizable()
                        .frame(width: 40, height: 47)
                        .padding(.leading,24)
                    
                    attributedText
                            .padding(.leading,16)
                            .font(.title3)
                            .lineSpacing(5)
                        
                    Spacer()
                }
                
            }
            
            Text("내 냉장고")
                .frame(height: 30)
                
            MyFridgeListView()
            
            Spacer()
           
            HStack{
                Spacer()
                
                Button(action: { showModal = true } ){
                    Circle()
                        .frame(width: 56,height: 56)
                        .foregroundColor(.myprimary)
                        .overlay(Image(systemName: "plus")
                            .font(.system(size: 29, weight: .semibold))
                            .foregroundColor(.black),alignment: .center)
                        .padding(.bottom,25)
                }.sheet(isPresented: $showModal){
                    
                    addIngredientView()
                }
            }
            
        }.padding(20)
    }
}

struct MyFridgeView_Previews: PreviewProvider {
    
    static var previews: some View {
        MyFridgeView()
    }
}
