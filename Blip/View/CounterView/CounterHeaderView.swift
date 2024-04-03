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
                    Image(systemName: "chevron.left")
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
                .foregroundStyle(.red)
        }
        .frame(minHeight: 40)
        .safeAreaPadding(.top, 60)
        .safeAreaPadding(.horizontal)
    }
}

//#Preview {
//    CounterHeaderView(currentStop: "Edutown 1",
//                      departureTime: "05:50", presentationMode: .constant(PresentationMode))
//}
