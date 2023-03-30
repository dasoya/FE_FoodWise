//
//  DayTypeView.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI

struct DayTypeView: View {
    
    @State private var selectedMeal: MealType = MealType.breakfast

    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                
                Circle()
                    .foregroundColor(.myprimary)
                    .frame(width: 20,height:20)
                    .overlay(Text("1").subTitle2())
                
                Text("몇시에 드셨나요?")
                    .title2()
                
               
            }.padding(.bottom,16)
            
            Picker("식사 선택", selection: $selectedMeal) {
                Text("아침").tag(MealType.breakfast)
                   Text("점심").tag(MealType.lunch)
                   Text("저녁").tag(MealType.dinner)
            }
            .pickerStyle(SegmentedPickerStyle())
            .onAppear(){
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.myprimary)
                UISegmentedControl.appearance().backgroundColor = UIColor(.mygray2)

           }
            
            
            
            
        }.padding(20)
    }
}


struct DayTypeView_Previews: PreviewProvider {
    static var previews: some View {
        DayTypeView()
    }
}
