//
//  MyFridgeView.swift
//  FoodWise
//
//  Created by dasoya on 19.02.23.
//

import SwiftUI

struct MyFridgeView: View {
    
    var fridgeSectionImageDict = ["육류": "meat",
                                  "해산물": "seafood","과일": "fruit","유제품": "dairy","채소": "vegetable","기타": "etc"]
    
    
    var inventory = ["육류" : TestData.ingredients,"해산물": TestData.ingredients]
  
    
    var body: some View {
        VStack{
            
            Text("내 냉장고")
                .font(.title)
            
//
//            ForEach(inventory, id: .self){ item in
//
//
//
//            }
//
            
        }
    }
}

struct MyFridgeView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        MyFridgeView()
    }
}
