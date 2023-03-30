//
//  RecipeIngredientBox.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import SwiftUI

struct RecipeIngredientBox: View {
    
    @State private var isExpanded = false
    
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var ingredients : [Ingredient]
  
    
    init(ingredients: [Ingredient]){
        
        self.ingredients = ingredients
        
    }
    
    var body: some View {
       GroupBox(){
            
            DisclosureGroup(isExpanded: $isExpanded){
                
                ForEach(ingredients.indices){ index in
                    
                    if(index != 0)
                    {
                        Divider()
                    } else{
                        
                        Divider()
                            .padding(.vertical, 5)
                            .opacity(0)
                            
                    }
                    
                    HStack{
                        Group{
                            Text(ingredients[index].name)
                                .padding(.vertical, 3)
                            
                        }//: GROUP
                        .foregroundColor(.black)
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        if let amount = ingredients[index].amount {
                            Text("\(amount)g")
                                .multilineTextAlignment(.trailing)
                        }
                    }
                }//: LOOP
            }
                
        //: DISCLOSURE
        label: {
            HStack{
                Image("recipe_ingredient")
                    .resizable()
                    .frame(width:32,height:21)
                
                Text("레시피 재료")
                    .fontWeight(.bold)
            }
            
        }.foregroundColor(.black)
           
        
        }
        .groupBoxStyle(TransparentGroupBox())
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
            //.frame(width: 350,height: 70)
        
        
        
    }
    
}

struct RecipeIngredientBox_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientBox(ingredients: TestData.ingredients)
    }
}
