//
//  DiaryView.swift
//  FoodWise
//
//  Created by dasoya on 19.03.23.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        
        NavigationView{
            
            
            VStack(alignment: .leading){
                WeeklyHeader()
                    .padding(.top,38)
                
                ZStack(alignment: .bottom){
                    
                    HStack{
                        Spacer()
                        NavigationLink(destination: CreateDiaryView()){
                            Circle()
                                .frame(width: 56,height: 56)
                                .foregroundColor(.myprimary)
                                .overlay(Image(systemName: "plus")
                                    .font(.system(size: 29, weight: .semibold))
                                    .foregroundColor(.black),alignment: .center)
                                .padding(.bottom,45)
                            
                        }
                    }
                }
                
            }
        }
        
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
