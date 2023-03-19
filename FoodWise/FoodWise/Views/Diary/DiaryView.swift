//
//  DiaryView.swift
//  FoodWise
//
//  Created by dasoya on 19.03.23.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        WeeklyHeader()
            .padding(.top,38)
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
