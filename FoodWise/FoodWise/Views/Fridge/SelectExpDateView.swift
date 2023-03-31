//
//  SelectExpDateView.swift
//  FoodWise
//
//  Created by dasoya on 15.03.23.
//

import SwiftUI

///View which allows the selection of a due date
struct SelectExpDateView: View {
    @Environment(\.dismiss) var dismiss
    ///Due date
    @State var date: Date
    ///Selection handler
    /// - Parameters:
    ///  - newDate: changed value
    var onSelect: (_ newDate: Date) -> Void
    
    var body: some View {
        VStack {
            Text("소비 기한 설정").font(.headline)
                DatePicker(selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute]) {
                }.datePickerStyle(.graphical)
            Button("저장", action: {
                dismiss()
                onSelect(date)
            }).buttonStyle(.automatic).padding()
        }
    }
}


struct SelectExpDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectExpDateView(date: Date()) { newDate in
        }
    }
}

