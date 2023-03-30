//
//  deleteIngredientsView.swift
//  FoodWise
//
//  Created by dasoya on 30.03.23.
//

import SwiftUI

struct deleteIngredientsView: View {
    
    @State private var showModal : Bool = false
    @State private var deletionlist : [Ingredient] = [] //= TestData.ingredients
 
    
    var body: some View {
        
        VStack(alignment: .leading) {
            QuestionHeader(title: "냉장고 재고를 정리하세요!", order: 4)
           
            VStack{
                
                if deletionlist.count != 0 {
                    
                    ForEach(deletionlist){ item in
                        HStack{
                            
                            Text(item.name)
                                .padding(.leading,24)
                            if let amount = item.amount {
                                Text(amount.description  + "g")
                            }
                            
                           Spacer()
                        }.padding(5)
                        
                       Divider().frame(width: 316)
                    }.frame(alignment:.leading)
                    
                }
                
                Button {
                    self.showModal = true
                } label: {
                    Label("재료 추가하기", systemImage: "plus.circle")
                        .foregroundColor(.mygray4)
                        .padding(.top,deletionlist.count == 0 ? 0 : 12)
                        
                }.sheet(isPresented: $showModal) {
                    
                    selectItemInFridge(showModal: $showModal, deletionList: $deletionlist)
                        .presentationDetents([.fraction(0.9), .large])
                }

            }.frame(width: 350).padding(.vertical, 24).background(Color.mygray2).cornerRadius(10)
                
        }.padding(20)
      
        
    }
    
}

struct deleteIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        deleteIngredientsView()
    }
}
