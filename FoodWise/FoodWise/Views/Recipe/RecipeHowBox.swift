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
    
    var body: some View {
        GroupBox(){
            DisclosureGroup(isExpanded: $isExpanded){
                ForEach(0..<nutrients.count, id: \.self){ index in
                    
                    if(index != 0)
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
                            .overlay(Text("\(index+1)").font(.caption))
                       
                           
                        
                        Group{
                            Text(nutrients[index])
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
        RecipeHowBox()
    }
}
