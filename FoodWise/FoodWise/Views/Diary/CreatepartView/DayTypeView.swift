//
//  DayTypeView.swift
//  FoodWise
//
//  Created by dasoya on 27.03.23.
//

import SwiftUI

struct DayTypeView: View {
    
    @Binding var selectedMeal: MealType? //= MealType.breakfast

    
    var body: some View {
        
        VStack(alignment: .leading){
            QuestionHeader(title: "몇시에 드셨나요?", order: 1)
            
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
        DayTypeView(selectedMeal: .constant(MealType.breakfast))
    }
}
