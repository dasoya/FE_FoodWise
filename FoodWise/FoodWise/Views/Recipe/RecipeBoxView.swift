//
//  RecipeBoxView.swift
//  FoodWise
//
//  Created by dasoya on 26.02.23.
//

import SwiftUI


struct RecipeBox : View {
    
    var recipe : Recipe
    @State var heart = false
    
    
    var body : some View {
        
        
        VStack(alignment: .leading, spacing: 8.0){
           
            ZStack(alignment: .topTrailing){
                Image("sample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160.0, height: 114.0)
                
               
                HStack(spacing: 3.06) {
                    
                    Toggle(isOn: $heart, label: {
                        Label{ } icon: {
                            Image(systemName: "heart.fill").font(.system(size: 13))
                        }
                            
                    })
                    .frame(width: 12, height: 10)
                    .toggleStyle(ButtonToggleStyle())
                    .foregroundColor(.red)
                
                    if let cnt = recipe.likeCnt{
                        Text("\(cnt)")
                            .font(.caption)
                            .lineSpacing(12)
                
                            
                    }
                }
                .frame(width: 38, height: 20, alignment: .center)
                .background(Color.white)
                .cornerRadius(3.76)
                .padding(10)
                   
                
            }
            
            Group{
                HStack(alignment: .top, spacing: 4) {
                    if let date = recipe.expiredDate{
                        let leftDay = Date().leftDay(from: date)
                        Text("D-\(leftDay)")
                            .font(.caption)
                            .foregroundColor(Color.white)
                            .lineSpacing(12)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(Color(red: 1, green: 0.42, blue: 0.24))
                            .cornerRadius(2)
                    }
                    
                    if let ingredient = recipe.ingredient {
                        Text(ingredient)
                            .font(.caption)
                            .foregroundColor(Color.white)
                            .lineSpacing(12)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(Color(red: 0.38, green: 0.38, blue: 0.45))
                            .cornerRadius(2)
                    }
                }
                
                Text(recipe.name)
                    .fontWeight(.medium)
                    .font(.callout)
                    .lineSpacing(16)
                    .padding(.bottom,10)
                    .padding(.top,-2)
                
            } //.padding(.vertical, 1)
            .padding(.leading, 12)
            .padding(.trailing, 63)
                
            
        }
       
           // .frame(width: 87, height: 38)
//            .padding(.vertical, 11)
//            .padding(.leading, 10)
//            .padding(.trailing, 63)
           // .frame(width: 160, height: 60)
            .background(Color(red: 0.96, green: 0.96, blue: 0.98))
            .cornerRadius(4)
    }
    
    
    
}

struct TestData {
    static var recipe = Recipe(id:"none",name:"투움바 파스타", imageURL: URL(fileURLWithPath: "none"),likeCnt: 32, ingredient: "면", expiredDate: Date())
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HStack{
            RecipeBox(recipe: TestData.recipe)
                .previewLayout(.sizeThatFits)
            RecipeBox(recipe: TestData.recipe)
                .previewLayout(.sizeThatFits)
        }
    }
}
