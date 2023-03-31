//
//  IngredientListRow.swift
//  FoodWise
//
//  Created by dasoya on 18.03.23.
//

import SwiftUI

struct IngredientListRow: View {
    
    
    var item  = TestData.ingredient
    
    var dateFormat =  DateFormatter()
    var isSelected = false
    
    var body: some View {
       
        dateFormat.dateFormat = "yyyy.MM.dd"
      
        return HStack {
            Text(item.name)
                .frame(width:130,alignment: .leading)
                .padding(.leading,20)

            Spacer()
            Text("\(item.amount ?? 0) g")

            Spacer()

            if let date = item.expiredDate{

                Text(dateFormat.string(from: date))
            }

            Text("").padding(.trailing,20)

        }
        .swipeActions(){
            /// Action to show the modal view with project information.
            Button (action: {

            }){
                Label("info", systemImage: "info.circle")
            }.tint(.indigo)

            /// Action to delete the project.
            Button (action: {

            }){
                Label("delete", systemImage: "minus.circle")
            }.tint(.red)

        }
        .frame(width: 350, height: 49)
        .background(isSelected ? .myprimary : Color.mygray2)
            .cornerRadius(6)
                    
    }
    
}

struct IngredientListRow_Previews: PreviewProvider {
    
    static var previews: some View {

        IngredientListRow()
    }
}
