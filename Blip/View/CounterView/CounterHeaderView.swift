//
//  CounterHeaderView.swift
//  Blip
//
//  Created by Elian Richard on 02/04/24.
//

import SwiftUI


struct CounterHeaderView: View {
    var currentStop: String
    var departureTime: String
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack (spacing: 15) {
            HStack (alignment: .center, spacing: 10) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "list.bullet")
                        .imageScale(.large)
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                }
                Text(currentStop)
                    .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.1)
                    .scaledToFit()
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Text (departureTime)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(isLate(departureTime) ? .red : .green)
        }
        .frame(minHeight: 40)
        .safeAreaPadding(.top, 60)
        .safeAreaPadding(.horizontal)
    }
    
    func isLate (_ departureTime: String) -> Bool {
        let currentDate = Date()
        let currentCalendar = Calendar.current
        let currentHour = currentCalendar.component(.hour, from: currentDate)
        let currentMinutes = currentCalendar.component(.minute, from: currentDate)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let departureFormattedTime = formatter.date(from: departureTime) ?? Date()
        let currentFormattedTime = formatter.date(from: "\(currentHour):\(currentMinutes)") ?? Date()

        if (departureFormattedTime >= currentFormattedTime) { return false }
        else { return true }
    }
}
