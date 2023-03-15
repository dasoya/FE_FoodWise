//
//  addIngredientView.swift
//  FoodWise
//
//  Created by dasoya on 13.03.23.
//

import SwiftUI
import Combine

struct addIngredientView: View {
    
    @State var expiredDate : Date = Date()
    @State var amount : String = "0"
    
    var body: some View {
        
        VStack{
            
            Text("식재료 등록")
            
            
            ///재료 검색
            
            
            
            ///용량
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.mygray)
                .frame(width: 262, height: 49)
                .overlay(content: {
                    
                    HStack{
                        Text("용량")
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                        
                        TextField("300", text: self.$amount)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(width: 150, height: 49)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .onReceive(Just(amount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.amount = filtered
                                }
                            }
                        
                        Text("g")
                            .padding(.trailing)
                    }
                })
           
            
            ///소비 기한
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.mygray)
                .frame(width: 262, height: 49)
                .overlay(content: {
                    HStack{
                        Text("소비기한")
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                        
                        DatePicker(selection: $expiredDate, in: expiredDate..., displayedComponents: [.date]) {}
                            .padding()
                            
                    }
                })
            
          
    }
            
        
        
    }
}

struct addIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        addIngredientView()
    }
}
