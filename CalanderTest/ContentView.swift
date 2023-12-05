//
//  ContentView.swift
//  CalanderTest
//
//  Created by Joel Storr on 05.12.23.
//

import SwiftUI

struct ContentView: View {
    
    
    @EnvironmentObject var dateHolder: DateHolder
    
    var body: some View {
        
        VStack(spacing: 1) {
            DateScrollView()
                .environmentObject(dateHolder)
                .padding()
            dayOfWeekStack
            calanderGrid
        }
        
    }
    
    
    var dayOfWeekStack: some View {
        HStack(spacing: 1) {
            Text("Sun").dayOfWeek()
            Text("Mon").dayOfWeek()
            Text("Tue").dayOfWeek()
            Text("Wed").dayOfWeek()
            Text("Thu").dayOfWeek()
            Text("Fri").dayOfWeek()
            Text("Sat").dayOfWeek()
        }
    }
    
    
    var calanderGrid: some View {
        VStack(spacing: 1) {
            let daysInMonth = CalendarHelper().daysInMonth(dateHolder.date)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let previousMonth = CalendarHelper().minusMonth(dateHolder.date)
            let daysInPreviousMonth = CalendarHelper().daysInMonth(previousMonth)
            
            ForEach(0..<6) { row in
                HStack(spacing: 1) {
                    ForEach(1..<8) { column in
                            let count = column + (row * 7)
                            CalendarCell(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPreviousMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
    
}

#Preview {
    ContentView()
}



extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}
