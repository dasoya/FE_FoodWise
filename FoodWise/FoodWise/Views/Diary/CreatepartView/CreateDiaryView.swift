//
//  CreateDiaryView.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI

struct CreateDiaryView: View {
    
    @State var newDiary : DayDiary = DayDiary(menu: "")
    @State var mealType : MealType?
    
    
    var body: some View {
        NavigationView(){
            
            VStack{
                DayTypeView(selectedMeal: $mealType)
            }
        }.navigationTitle(Text("식단 추가"))
    }
}

struct QuestionHeader : View {
    
    let title : String
    let order : Int
    
    var body: some View {
        HStack{
            
            Circle()
                .foregroundColor(.myprimary)
                .frame(width: 20,height:20)
                .overlay(Text(order.description).subTitle2())
            
            Text(title)
                .title2()
            
           
        }.padding(.bottom,16)
    }
}

struct CreateDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateDiaryView()
    }
}
