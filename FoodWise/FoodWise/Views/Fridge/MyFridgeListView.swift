//
//  MyFridgeListView.swift
//  FoodWise
//
//  Created by dasoya on 13.03.23.
//

import SwiftUI

struct MyFridgeListView : View{
    
    var fridgeSectionImageDict = ["육류": "meat",
                                  "해산물": "seafood","과일": "fruit","유제품": "dairy","채소": "vegetable","기타": "etc"]
    
    
    var inventory = ["육류" : TestData.ingredients,"해산물": TestData.ingredients]

    
   
    var body: some View {
        
        
        var categoryIngreList = [AnyView]()
        
        inventory.forEach{ key,values in

            let icon = fridgeSectionImageDict[key]
           
            let categoryHeader = HStack{
                
                    Image(icon ?? "etc")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .aspectRatio(contentMode: .fit)
                
                    Text(key)
                    Spacer()
            }
            
            
            
            var categoryList = ForEach( values, id:\.self) { value in

                IngredientListRow(item: value)
                
            }
            
            categoryIngreList.append(AnyView(categoryHeader))
            categoryIngreList.append(AnyView(categoryList))
            categoryIngreList.append(AnyView(Text("").padding(3)))
            
        }
        
        return Group {
            
            ForEach(0...categoryIngreList.count-1,id: \.self) { index in
                categoryIngreList[index]
            }

        }
        
    }
}

//struct MyFridgeListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyFridgeListView()
//    }
//}
