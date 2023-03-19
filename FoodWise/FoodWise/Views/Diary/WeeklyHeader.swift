//
//  WeeklyHeader.swift
//  FoodWise
//
//  Created by dasoya on 19.03.23.
//

import SwiftUI

struct WeeklyHeader: View {
    @StateObject var weekStore = WeekStore()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0

    var body: some View {
        
        VStack(){
            
            HStack{
                
                Button(){
                        
                        draggingItem = snappedItem + 1
                    
                        snappedItem = draggingItem
                        
                        weekStore.update(index: Int(snappedItem))
                    
                } label: {
                    Image("leftArrow").resizable().frame(width: 12, height: 22)
                }
                
                Text(weekStore.dateToString(date: weekStore.currentDate, format: "YYYY년 MM월") + " \(weekStore.numberOfWeekInMonth(weekStore.currentDate).description)주차" )
                
                Button(){
                    draggingItem = snappedItem - 1
                
                    snappedItem = draggingItem
                    
                    weekStore.update(index: Int(snappedItem))
                } label: {
                    Image("rightArrow").resizable().frame(width: 12, height: 22)
                }
                
            }
            
            
            ZStack {
                
                ForEach(weekStore.allWeeks) { week in
                    VStack{
                        
                        HStack {
                            ForEach(0..<7) { index in
                                VStack(spacing: 8) {
                                    Text(weekStore.dateToString(date: week.date[index], format: "EEE"))
                                        .font(.system(size:14))
                                        .fontWeight(.semibold)
                                        .frame(maxWidth:.infinity)
                                    
                                    RoundedRectangle(cornerRadius: 4.0)
                                        .frame(width: 32,height: 32)
                                        .foregroundColor(.mygray2)
                                        .overlay(){
                                            Text("3")
                                        }
                                    
                                    Text(weekStore.dateToString(date: week.date[index], format: "d"))
                                        .underline(weekStore.currentDate == week.date[index])
                                        .foregroundColor(weekStore.currentDate == week.date[index] ? .black : .mygray4)
                                        .font(.system(size:14))
                                        .frame(maxWidth:.infinity)
                                }
                                .onTapGesture {
                                    // Updating Current Day
                                    weekStore.currentDate = week.date[index]
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(
                            Rectangle()
                                .fill(.white)
                        )
                    }
                    .offset(x: myXOffset(week.id), y: 0)
                    .zIndex(1.0 - abs(distance(week.id)) * 0.1)
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxHeight:.infinity , alignment : .top)
            .padding(.top,24)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        draggingItem = snappedItem + value.translation.width / 400
                    }
                    .onEnded { value in
                        withAnimation {
                            if value.predictedEndTranslation.width > 0 {
                                draggingItem = snappedItem + 1
                            } else {
                                draggingItem = snappedItem - 1
                            }
                            snappedItem = draggingItem
                            
                            weekStore.update(index: Int(snappedItem))
                        }
                    }
            )
            
        }
    }
        
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(weekStore.allWeeks.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(weekStore.allWeeks.count) * distance(item)
        return sin(angle) * 200
    }
    
}

struct WeeklyHeader_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyHeader()
    }
}
