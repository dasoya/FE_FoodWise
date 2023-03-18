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
    
    @State private var searchText = ""
    @State private var isSearchEdting = false
    @Binding var showModal : Bool
    
    var body: some View {
        
        VStack{
            
            Text("식재료 등록")
                .padding(.bottom,24)
            
            ///재료 검색
            SearchBar(text: $searchText,isEditing: $isSearchEdting)
            
            
            if(!searchText.isEmpty && isSearchEdting ){
                ScrollView(.horizontal){
                    HStack{
                        ForEach(TestData.ingredients.filter({ searchText.isEmpty ? false : $0.name.contains(searchText) })) { item in
                            
                            Button{
                               
                                isSearchEdting = false
                                searchText = item.name
                                
                            }label: {
                                Text(item.name).grayBtnBoxTextStyle()
                                
                            }
                        }
                    }
                }
                .frame(width: 320)
                .padding()
            }
                    
            
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
            
            ///등록 버튼
            HStack{
                Button{showModal = false} label: {
                    Text("취소")
                        .foregroundColor(.black)
                        .frame(width: 128,height: 49)
                        .background(Color.mygray4)
                        .cornerRadius(10)
                     
                }
                
                Spacer()
                
                Button{showModal = false} label: {
                    Text("등록")
                        .foregroundColor(.black)
                        .frame(width: 128,height: 49)
                        .background(Color.myprimary)
                        .cornerRadius(10)
                     
                }
                
                
            }.frame(width: 262, height: 49)
                .padding(.top,24)
            
            
            
          
    }
            
        
        
    }
}

struct addIngredientView_Previews: PreviewProvider {
    
    static var previews: some View {
        addIngredientView(showModal: .constant(true))
    }
}
