//
//  getMenuName.swift
//  FoodWise
//
//  Created by dasoya on 30.03.23.
//

import SwiftUI

struct getMenuName: View {
    
    @State private var menuName : String = ""
    @State private var selectedAsw: Bool? = false
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            if selectedAsw == false {
                getNameFromUser()
            }
            
            QuestionHeader(title: "'김치찌개'인가요?" , order: 3)
            
            
            Picker("메뉴이름 확인", selection: $selectedAsw) {
                Text("네").tag(true)
                Text("아니오").tag(false)
                
            }
            .frame(width:232)
            .pickerStyle(SegmentedPickerStyle())
            .onAppear(){
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.myprimary)
                UISegmentedControl.appearance().backgroundColor = UIColor(.mygray2)
            }
            
            
            
        }
    }
    
    func getNameFromUser() -> some View {
        
        VStack(alignment: .leading){
            QuestionHeader(title: "이름을 알려주세요", order: 4)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.mygray2)
                .frame(width: 262, height: 49)
                .overlay(content: {
                    TextField("요리명을 입력하세요", text: self.$menuName)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(width: 150, height: 49)
                })
            
            
        }.padding(.bottom,32)
        
    }
    
}
    
    struct getMenuName_Previews: PreviewProvider {
        static var previews: some View {
            getMenuName()
        }
    }
