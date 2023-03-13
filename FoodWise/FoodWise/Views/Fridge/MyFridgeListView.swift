//
//  MyFridgeListView.swift
//  FoodWise
//
//  Created by dasoya on 13.03.23.
//

import SwiftUI

struct MyFridgeListView: View {
    
    var fridgeSectionImageDict = ["육류": "meat",
                                  "해산물": "seafood","과일": "fruit","유제품": "dairy","채소": "vegetable","기타": "etc"]
    
    
    var inventory = ["육류" : TestData.ingredients,"해산물": TestData.ingredients]
  
    
    var body: some View {
        var categoryIngreList = [AnyView]()
        let dateFormat =  DateFormatter()// DateIntervalFormatter()
        dateFormat.dateFormat = "yyyy.MM.dd"
        
        inventory.forEach{ key,values in

            let icon = fridgeSectionImageDict[key]
            let padding = 20.0
            let categoryHeader = HStack{
                
                
                    
                    Image(icon ?? "etc")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .aspectRatio(contentMode: .fit)
                
                    Text(key)
                    Spacer()
            }
            
            let categoryList = ForEach(values, id:\.self) { value in
                ZStack(){
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.mygray)
                    .frame(width: 350, height: 49)
                    
                    HStack(){
                        Text(value.name)
                            .padding(.leading,padding)
                        Spacer(minLength: 61)
                        Text("\(value.amount ?? 0) g")
                        Spacer()
                        if let date = value.expiredDate{
                            Text(dateFormat.string(from: date))
                        }
                        
                        Text("").padding(.trailing,padding)
                        
                    }.frame(width: 350, height: 49)
                       
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

struct MyFridgeListView_Previews: PreviewProvider {
    static var previews: some View {
        MyFridgeListView()
    }
}
