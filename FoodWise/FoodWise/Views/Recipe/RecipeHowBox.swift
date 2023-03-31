//
//  RecipeHowBox.swift
//  FoodWise
//
//  Created by dasoya on 06.03.23.
//

import SwiftUI


struct RecipeHowBox: View {
    
    @State private var isExpanded = false
    
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    var recipeList : [RecipeHow]
    
    init(recipeList : [RecipeHow]){
        self.recipeList = recipeList
    }
    
    var body: some View {
        
        
        
        return GroupBox(){
            DisclosureGroup(isExpanded: $isExpanded){
                
                ForEach(recipeList){ item in
                    
                    if(item.id != 1)
                    { Divider()
                    }else{
                        Divider()
                            .padding(.vertical, 5)
                            .opacity(0)
                    }
                    
                    
                    
                    HStack{
                        
                        Circle()
                            .fill(Color(red: 0.78, green: 0.78, blue: 0.78))
                            .frame(width: 20,height:20)
                            .overlay(Text("\(item.id)").font(.caption))
                       
                           
                        
                        Group{
                            Text(item.content)
                                .padding(.vertical, 3)
                            
                        }//: GROUP
                        .foregroundColor(.black)
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                    }
                }//: LOOP
            }//: DISCLOSURE
        label: {
            HStack{
                Image("recipe_how")
                    .resizable()
                    .frame(width:32,height:26)
                
                Text("요리 방법")
                    .fontWeight(.bold)
            }
            
        }.foregroundColor(.black)
       
        }
        .groupBoxStyle(TransparentGroupBox())
        .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
        )
    }
    
}

struct RecipeHowBox_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHowBox(recipeList: TestData.recipeList1)
    }
}
