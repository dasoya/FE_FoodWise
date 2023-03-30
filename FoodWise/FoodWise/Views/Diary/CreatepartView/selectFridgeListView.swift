//
//  selectFridgeListView.swift
//  FoodWise
//
//  Created by dasoya on 30.03.23.
//

import SwiftUI

struct selectFridgeListView: View {
        
        var fridgeSectionImageDict = ["육류": "meat",
                                      "해산물": "seafood","과일": "fruit","유제품": "dairy","채소": "vegetable","기타": "etc"]
        
        
        var inventory = ["육류" : TestData.ingredients,"해산물": TestData.ingredients]
    
        @Binding var selectedItem : Ingredient?
       
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
                
                
                
                let categoryList = ForEach(values, id:\.self) { value in
                    
                    Button{
                        selectedItem = value
                    } label: {
                        
                        let isSelected = selectedItem?.id == value.id
                        
                        IngredientListRow(item: value, isSelected : isSelected)
                            .foregroundColor(.black)
                            
                    }
                  
                    
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

struct selectFridgeListView_Previews: PreviewProvider {
    static var previews: some View {
        selectFridgeListView(selectedItem: .constant(TestData.ingredient))
    }
}
