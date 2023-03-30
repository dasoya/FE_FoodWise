//
//  selectItemInFridge.swift
//  FoodWise
//
//  Created by dasoya on 30.03.23.
//

import SwiftUI
import Combine

struct selectItemInFridge: View {
    
    @State var selectedIngredient : Ingredient?
    @State var amount : String = "0"
    @Binding var showModal : Bool
    @Binding var deletionList : [Ingredient]
    
    var body: some View {
        VStack(){
            
           Spacer()
                .padding(.bottom, 20)
            
            selectFridgeListView(selectedItem : $selectedIngredient)
                .padding(.horizontal,20)
               
            
            if let item = selectedIngredient{
                
                VStack(alignment: .leading){
                    Text(item.name + " 용량")
                        .title3()
                        .padding(.leading,20)
                        .padding(.bottom,14)
                    
                    
                    HStack{
                        
                        Text("사용량")
                            .subTitle3()
                            .padding(.leading,20)
                        
                        TextField("", text: $amount)
                            .font(.custom("GmarketSansTTFBold", size: 18))
                            .textFieldStyle(PlainTextFieldStyle())
                            .background(RoundedRectangle(cornerRadius: 19).fill(.white).frame(width: 113,height: 38)
                            )
                            .keyboardType(.numberPad)
                            .frame(width: 113,height: 38)
                            .multilineTextAlignment(.center)
                            .onReceive(Just(amount)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.amount = filtered
                                }
                            }
                        
                        Text("g / 현재 재고량 \(item.amount ?? 0)g")
                            .subTitle3()
                        
                        Spacer()
                    }
                }.frame(width: UIScreen.main.bounds.width,height: 132).background(Color.mygray2)
                    .padding(.bottom,-10)
                    
            }
            
            HStack(alignment: .bottom, spacing:0){
                 Button {
                     showModal =  false
                 } label: {
                     Text("취소")
                         .title2()
                         .frame(width: 156,height: 50,alignment: .bottom)
                         .background(Color.mygray3)

                 }

                
                 Button {
                     selectedIngredient?.amount = Int(amount)
                     if let item = selectedIngredient{
                         deletionList.append(item)
                         
                     }
                     
                     showModal = false
                 } label: {
                     Text("등록")
                         .title2()
                         .frame(width: UIScreen.main.bounds.width - 156,height: 50,alignment: .bottom)
                         .background(Color.myprimary)
                        
                 }

             }.foregroundColor(.black)
             
         }
    }
}

struct selectItemInFridge_Previews: PreviewProvider {
    static var previews: some View {
        selectItemInFridge(showModal: .constant(false), deletionList: .constant(TestData.ingredients))
    }
}
