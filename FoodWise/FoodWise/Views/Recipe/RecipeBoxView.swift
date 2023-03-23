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
                            .tag1()
                            .font(.caption)
                            .lineSpacing(12)
                            .foregroundColor(.black)
                
                            
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
                       // let leftDay = Date().leftDay(from: date)
                        Text("D-\(date)")
                            .tag1()
                            .foregroundColor(Color.white)
                            .lineSpacing(12)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .fixedSize(horizontal: false, vertical: true)
                            .background(Color.myprimary)
                            .cornerRadius(2)
                    }
                    
                    if let ingredient = recipe.ingredient {
                        Text(ingredient).grayBoxTextStyle()
                    }
                }
                
                Text(recipe.name)
                    .subTitle3()
                    .foregroundColor(.black)
                    .lineSpacing(16)
                    .padding(.bottom,10)
                    .padding(.top,-2)
                
            } //.padding(.vertical, 1)
            .padding(.leading, 12)
            .padding(.trailing, 63)
                
            
        }
        .background(Color.mygray1)
        .cornerRadius(4)
        .shadow(color: .mygray2, radius: 2)
    }
    
    
    
}



struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HStack{
            RecipeBox(recipe: TestData.recipe)
                .previewLayout(.sizeThatFits)
          
        }
    }
}
